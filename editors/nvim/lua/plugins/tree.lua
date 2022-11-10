-- live grep using Telescope inside the current directory under
-- the cursor (or the parent directory of the current file)
local function grep_in(node)
	if not node then
		return
	end
	local path = node.absolute_path or vim.loop.uv.cwd()
	if node.type ~= 'directory' and node.parent then
		path = node.parent.absolute_path
	end
	require('telescope.builtin').live_grep({
		search_dirs = { path },
		prompt_title = string.format('Grep in [%s]', vim.fs.basename(path)),
	})
end

require 'nvim-tree'.setup({
	view = {
		width = 55,
		mappings = {
			list = {
				{ key = '<Leader>gr', action = 'grep_at', action_cb = grep_in, mode = 'n' },
			},
		},
	},
})
vim.g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }
