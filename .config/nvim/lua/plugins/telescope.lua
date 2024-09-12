return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-lua/popup.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")

		local custom_actions = {}
		function custom_actions.fzf_multi_select(prompt_bufnr)
			local picker = action_state.get_current_picker(prompt_bufnr)
			local num_selections = table.getn(picker:get_multi_selection())

			if num_selections > 1 then
				-- actions.file_edit throws - context of picker seems to change
				--actions.file_edit(prompt_bufnr)
				actions.send_selected_to_qflist(prompt_bufnr)
				actions.open_qflist()
			else
				actions.file_edit(prompt_bufnr)
			end
		end

		telescope.setup({
			defaults = {
				selection_caret = " ❯ ",
				entry_prefix = "  ",
				previewer = false,
				layout_strategy = "bottom_pane", -- Puts the window at the bottom
				layout_config = {
					prompt_position = "bottom", -- Puts the cursor at the bottom of the window
					height = 0.99,
				},
				mappings = {
					i = {
						["<esc>"] = actions.close, -- Close on escape
						["<cr>"] = custom_actions.fzf_multi_select,
					},
					n = {
						["<cr>"] = custom_actions.fzf_multi_select,
					},
				},
			},
			pickers = {
				find_files = {
					previewer = false,
				},
				buffers = {
					sort_lastused = true,
					previewer = false,
					height = 0.99,
					mappings = {
						i = { ["<c-d>"] = require("telescope.actions").delete_buffer },
						n = { ["<c-d>"] = require("telescope.actions").delete_buffer },
					},
				},
			},
		})
	end,
}
