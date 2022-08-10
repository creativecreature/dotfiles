local config = {}

function config.nvim_tree()
	require 'nvim-tree'.setup({
		disable_netrw = false,
		hijack_cursor = true,
		hijack_netrw = true,
	})
	vim.g.nvim_tree_width = 55
	vim.g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }
end

function config.telescope()
	local telescope = require('telescope')
	local actions = require('telescope.actions')

	telescope.load_extension('fzy_native')
	telescope.load_extension("live_grep_args")
	telescope.load_extension("git_worktree")

	telescope.setup {
		defaults = {
			previewer = false,
			layout_strategy = "bottom_pane", -- Puts the window at the bottom
			layout_config = {
				prompt_position = "bottom", -- Puts the cursor at the bottom of the window
				height = 0.3
			},
			mappings = {
				i = { ["<esc>"] = actions.close } -- Close on escape
			}
		},
		pickers = {
			find_files = {
				previewer = false,
			},
			buffers = {
				sort_lastused = true,
				mappings = {
					i = { ["<c-d>"] = require("telescope.actions").delete_buffer },
					n = { ["<c-d>"] = require("telescope.actions").delete_buffer }
				}
			}
		}
	}
end

function config.todo_comments()
	require('todo-comments').setup({
		signs = true, -- show icons in the signs column
		sign_priority = 8, -- sign priority
		-- keywords recognized as todo comments
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } }
		}
	})
end

return config
