require("catppuccin").setup {
	flavour = "macchiato", -- mocha, macchiato, frappe, latte
	integrations = {
		treesitter = true,
		nvimtree = true,
	},
}
vim.api.nvim_command "colorscheme catppuccin"
