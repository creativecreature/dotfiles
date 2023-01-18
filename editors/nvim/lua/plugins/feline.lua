local colors = {
	background = '#252837',
	foreground = '#a6accd',

	background_darker = '#232534',
	highlight = '#2b2f40',
	references = '#2e2e41',
	selection = '#343A51',
	statusline = '#1d1f2b',
	foreground_darker = '#7982b4',
	line_numbers = '#4e5579',
	comments = '#676e95',

	red = '#ff5370',
	orange = '#f78c6c',
	yellow = '#ffcb6b',
	green = '#c3e88d',
	cyan = '#89ddff',
	blue = '#82aaff',
	paleblue = '#b2ccd6',
	purple = '#D49BFD',
	brown = '#c17e70',
	pink = '#f07178',
	violet = '#bb80b3',

	-- Mix 6 background / 10 color
	red_dark = '#9e4057',
	orange_dark = '#9a6054',
	blue_dark = '#5970a6',
	green_dark = '#7d9367',

	-- Diff change
	-- Mix 7 background / 1 #00BE6A
	diff_add_background = '#203b3d',
	-- Mix 2 background / 1 #00BE6A
	diff_add_highlight = '#1c4e44',
	-- Mix 5 background / 1 red
	diff_delete_background = '#492f41',
	-- Mix 2 background / 1 red
	diff_delete_hightlight = '#6e364a',
}

local lsp = require "feline.providers.lsp"

local assets = {
	left_separator = "",
	right_separator = "",
	lsp = {
		server = "",
		error = "",
		warning = "",
		info = "",
		hint = "",
	}
}

local settings = {
	text = colors.selection,
	bkg = colors.selection,
	curr_file = colors.paleblue,
}

local mode_colors = {
	["n"] = { "NORMAL", colors.paleblue },
	["no"] = { "N-PENDING", colors.paleblue },
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
	["c"] = { "COMMAND", colors.cyan },
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
		if shortline then return true end

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
		provider = function() return " " .. mode_colors[vim.fn.mode()][1] .. " " end,
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
				if not percentage then return "" end
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
					return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
				end

				return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
			end

			return ""
		end,
		enabled = is_enabled(80),
		hl = {
			fg = colors.paleblue,
			bg = settings.bkg,
		},
	}

	-- genral diagnostics (errors, warnings. info and hints)
	components.active[2][2] = {
		provider = "diagnostic_errors",
		enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,

		hl = {
			fg = colors.pink,
			bg = settings.bkg,
		},
		icon = " " .. assets.lsp.error .. " ",
	}

	components.active[2][3] = {
		provider = "diagnostic_warnings",
		enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
		hl = {
			fg = colors.yellow,
			bg = settings.bkg,
		},
		icon = " " .. assets.lsp.warning .. " ",
	}

	components.active[2][4] = {
		provider = "diagnostic_info",
		enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
		hl = {
			fg = colors.blue_dark,
			bg = settings.bkg,
		},
		icon = " " .. assets.lsp.info .. " ",
	}

	components.active[2][5] = {
		provider = "diagnostic_hints",
		enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
		hl = {
			fg = colors.paleblue,
			bg = settings.bkg,
		},
		icon = " " .. assets.lsp.hint .. " ",
	}


	-- RIGHT (Current File)
	components.active[3][1] = {
		provider = function()
			local filename = vim.fn.expand "%:t"
			return " " .. filename .. " "
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

require("feline").setup {
	components = get(),
}
