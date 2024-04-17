return {
	{ "marko-cerovac/material.nvim" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-endwise" },
	{ "tpope/vim-commentary" },
	{ "christoomey/vim-sort-motion" },
	{ "folke/todo-comments.nvim" },
	{ "easymotion/vim-easymotion" },
	{ "tpope/vim-fugitive" },
	{ "christoomey/vim-tmux-navigator" },
	{ "creativecreature/pulse" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			local colorizer = require("colorizer")
			colorizer.setup()
		end,
	},
}
