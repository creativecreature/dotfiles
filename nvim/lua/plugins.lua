-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Failed to require packer")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})

-- Install plugins
return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- UI
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "creativecreature/palenightfall.nvim" })
	use({
		"feline-nvim/feline.nvim",
		config = function()
			require("plugins.feline")
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- Languages
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig")
		end,
		requires = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.treesitter")
		end,
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Editing
	use({
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		after = { "copilot-cmp" },
		config = function()
			require("plugins.cmp")
		end,
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-emoji",
			{
				"windwp/nvim-autopairs",
				config = function()
					require("nvim-autopairs").setup({ map_cr = false })
				end,
			},
		},
	})
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-endwise")
	use("tpope/vim-commentary")
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("plugins.autotag")
		end,
		after = "nvim-treesitter",
	})
	use("christoomey/vim-sort-motion")
	-- use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

	-- Project navigation
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.tree")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
		config = function()
			require("plugins.telescope")
		end,
	})
	use({
		"folke/todo-comments.nvim",
		requires = "telescope.nvim",
		config = function()
			require("plugins.todo-comments")
		end,
	})

	-- File navigation
	use("easymotion/vim-easymotion")

	-- Task running
	use({
		"vim-test/vim-test",
		requires = "preservim/vimux",
		config = function()
			require("plugins.vim-test")
		end,
	})

	-- Git
	use("tpope/vim-fugitive")
	use({
		"ThePrimeagen/git-worktree.nvim",
		requires = "telescope.nvim",
		config = function()
			require("plugins.git-worktree")
		end,
	})

	-- Tmux
	use("christoomey/vim-tmux-navigator")

	-- Misc
	use("creativecreature/vim-code-harvest")

	local has_plugins, plugins = pcall(require, "custom.plugins")
	if has_plugins then
		plugins(use)
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
