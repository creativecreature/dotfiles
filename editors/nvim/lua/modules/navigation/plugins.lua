local plugin = require('core.pack').register_plugin
local conf = require('modules.navigation.config')

plugin { 'kyazdani42/nvim-tree.lua', config = conf.nvim_tree }

plugin({
	'nvim-telescope/telescope.nvim',
	-- cmd = 'Telescope',
	config = conf.telescope,
	requires = {
		{ 'nvim-lua/popup.nvim' },
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-fzy-native.nvim' },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "ThePrimeagen/git-worktree.nvim" },
	},
})

plugin {
	'folke/todo-comments.nvim',
	config = conf.todo_comments,
	requires = { "telescope.nvim" },
}
