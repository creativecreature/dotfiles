return {
	{ "catppuccin/nvim" },
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
	{ "creativecreature/vim-code-harvest" },
	{ dir = "~/code/personal/palenightfall.nvim" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			local colorizer = require("colorizer")
			colorizer.setup()
		end,
	},
}
