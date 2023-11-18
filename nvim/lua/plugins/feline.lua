return {
	"feline-nvim/feline.nvim",
	config = function()
		require("plugins.feline")
		local theme = string.sub(vim.fn.system("tmux show-environment THEME"), 7):gsub("%s+$", "")
		local function getColors()
			if theme == "dark" then
				return {
					background = "#292D3E",
					red = "#f07178",
					green = "#c3e88d",
					yellow = "#ffcb6b",
					magenta = "#D49BFD",
					cyan = "#89ddff",
					purple = "#70C1F2",
					violet = "#bb80b3",
				}
			end
			return {
				background = "#EFF1F5",
				red = "#e64553",
				green = "#40A02B",
				yellow = "#DF8E1D",
				magenta = "#EA76CB",
				cyan = "#179299",
				purple = "#7287fd",
			}
		end

		local colors = getColors()
		local lsp = require("feline.providers.lsp")

		local assets = {
			left_separator = "",
			right_separator = "",
			lsp = {
				server = "󰅡",
				error = "󰅙",
				warning = "",
				info = "",
				hint = "",
			},
		}

		local settings = {
			text = colors.background,
			bkg = colors.background,
			curr_file = colors.purple,
		}

		local mode_colors = {
			["n"] = { "NORMAL", colors.purple},
			["no"] = { "N-PENDING", colors.purple },
			["i"] = { "INSERT", colors.green },
			["ic"] = { "INSERT", colors.green },
			["t"] = { "TERMINAL", colors.green },
			["v"] = { "VISUAL", colors.yellow },
			["V"] = { "V-LINE", colors.yellow },
			[""] = { "V-BLOCK", colors.yellow },
			["R"] = { "REPLACE", colors.brown },
			["Rv"] = { "V-REPLACE", colors.brown },
			["s"] = { "SELECT", colors.brown },
			["S"] = { "S-LINE", colors.brown },
			[""] = { "S-BLOCK", colors.brown },
			["c"] = { "COMMAND", colors.magenta },
			["cv"] = { "COMMAND", colors.cyan },
			["ce"] = { "COMMAND", colors.cyan },
			["r"] = { "PROMPT", colors.cyan },
			["rm"] = { "MORE", colors.cyan },
			["r?"] = { "CONFIRM", colors.purple },
			["!"] = { "SHELL", colors.green },
		}

		local function get()
			local shortline = false

			local components = {
				active = { {}, {}, {} }, -- left, center, right
				inactive = { {} },
			}

			local function is_enabled(min_width)
				if shortline then
					return true
				end

				return vim.api.nvim_win_get_width(0) > min_width
			end

			-- LEFT (Vim Mode)
			local vi_mode_hl = function()
				return {
					fg = settings.text,
					bg = mode_colors[vim.fn.mode()][2],
				}
			end

			components.active[1][1] = {
				provider = function()
					return " " .. mode_colors[vim.fn.mode()][1] .. " "
				end,
				hl = vi_mode_hl,
			}

			components.active[1][2] = {
				provider = assets.right_separator,
				hl = function()
					return {
						fg = mode_colors[vim.fn.mode()][2],
						bg = settings.bkg,
					}
				end,
			}

			-- MIDDLE (Diagnostics, Workspace Loader)
			components.active[2][1] = {
				provider = function()
					local Lsp = vim.lsp.util.get_progress_messages()[1]

					if Lsp then
						local msg = Lsp.message or ""
						local percentage = Lsp.percentage
						if not percentage then
							return ""
						end
						local title = Lsp.title or ""
						local spinners = {
							"",
							"",
							"",
						}
						local success_icon = {
							"",
							"",
							"",
						}
						local ms = vim.loop.hrtime() / 1000000
						local frame = math.floor(ms / 120) % #spinners

						if percentage >= 70 then
							return string.format(
								" %%<%s %s %s (%s%%%%) ",
								success_icon[frame + 1],
								title,
								msg,
								percentage
							)
						end

						return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
					end

					return ""
				end,
				enabled = is_enabled(80),
				hl = {
					fg = colors.purple,
					bg = settings.bkg,
				},
			}

			-- general diagnostics (errors, warnings. info and hints)
			components.active[2][2] = {
				provider = "diagnostic_errors",
				enabled = function()
					return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
				end,
				hl = {
					fg = colors.red,
					bg = settings.bkg,
				},
				icon = " " .. assets.lsp.error .. " ",
			}

			components.active[2][3] = {
				provider = "diagnostic_warnings",
				enabled = function()
					return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
				end,
				hl = {
					fg = colors.yellow,
					bg = settings.bkg,
				},
				icon = " " .. assets.lsp.warning .. " ",
			}

			components.active[2][4] = {
				provider = "diagnostic_info",
				enabled = function()
					return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
				end,
				hl = {
					fg = colors.blue_dark,
					bg = settings.bkg,
				},
				icon = " " .. assets.lsp.info .. " ",
			}

			components.active[2][5] = {
				provider = "diagnostic_hints",
				enabled = function()
					return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
				end,
				hl = {
					fg = colors.paleblue,
					bg = settings.bkg,
				},
				icon = " " .. assets.lsp.hint .. " ",
			}

			-- RIGHT (Current File)
			components.active[3][1] = {
				provider = function()
					local row, column = unpack(vim.api.nvim_win_get_cursor(0))
					local filename = vim.fn.expand("%:t")
					return " " .. filename .. " " .. row .. ":" .. column .. " "
				end,
				enabled = function()
					local filename = vim.fn.expand("%:t")
					return not (filename == nil or filename == "")
				end,
				hl = {
					fg = settings.text,
					bg = settings.curr_file,
				},
				left_sep = {
					str = assets.left_separator,
					hl = {
						fg = settings.curr_file,
						bg = settings.bkg,
					},
				},
			}
			return components
		end

		require("feline").setup({
			components = get(),
		})
	end,
}
