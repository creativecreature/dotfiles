local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "Failed to require packer"
  return
end

-- Have packer use a popup window
packer.init {display = {open_fn = function() return require("packer.util").float {border = "rounded"} end}}

-- Install plugins
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- UI
  use({"kyazdani42/nvim-web-devicons"})
  use {'hoob3rt/lualine.nvim', config = function() require('plugins.lualine') end}
  use 'folke/tokyonight.nvim'
  use {'norcalli/nvim-colorizer.lua', event = "BufReadPre", config = function() require('colorizer').setup() end}
  -- Smooth Scrolling
  use({
    "karb94/neoscroll.nvim",
    keys = {"<C-u>", "<C-d>", "gg", "G"},
    config = function() require("plugins.neoscroll") end
  })
  use({"edluffy/specs.nvim", after = "neoscroll.nvim", config = function() require("plugins.specs") end})

  use "folke/lua-dev.nvim"
  use "williamboman/nvim-lsp-installer"
  use {'neovim/nvim-lspconfig', opt = true, event = "BufReadPre", config = function() require('plugins.lspconfig') end}
  use {
    'nvim-treesitter/nvim-treesitter',
    opt = true,
    event = "BufRead",
    run = ':TSUpdate',
    config = function() require('plugins.treesitter') end,
    requires = {'nvim-treesitter/nvim-treesitter-textobjects', 'williamboman/nvim-lsp-installer'}
  }

  -- Editing
  use({
    "hrsh7th/nvim-cmp",
    config = function() require("plugins.cmp") end,
    requires = {
      "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip", "hrsh7th/cmp-emoji",
      {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup({map_cr = false}) end}
    }
  })
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-endwise'
  use 'tpope/vim-commentary'
  use {'windwp/nvim-ts-autotag', config = function() require("plugins.autotag") end, after = "nvim-treesitter"}
  use 'christoomey/vim-sort-motion'

  -- Project navigation
  use {'kyazdani42/nvim-tree.lua', config = function() require('plugins.tree') end}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end
  }
  use {
    'folke/todo-comments.nvim',
    requires = "telescope.nvim",
    config = function() require('plugins.todo-comments') end
  }

  -- File navigation
  use 'easymotion/vim-easymotion'
  -- use 'mg979/vim-visual-multi'

  -- Task running
  use {'janko/vim-test', requires = 'preservim/vimux', config = function() require('plugins.vim-test') end}

  -- Git
  use 'tpope/vim-fugitive'
  use {
    'ThePrimeagen/git-worktree.nvim',
    requires = "telescope.nvim",
    config = function() require('plugins.git-worktree') end
  }

  -- Tmux
  use 'christoomey/vim-tmux-navigator'

  -- Wakatime
  use 'wakatime/vim-wakatime'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
