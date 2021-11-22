local fn = vim.fn

-- Setup packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Install plugins
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- UI
   use({
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
  })
  use {
    'hoob3rt/lualine.nvim',
	event = "VimEnter",
	wants = "nvim-web-devicons",
    config = function() require('plugins.lualine') end
  }
  use 'folke/tokyonight.nvim'
  use {'norcalli/nvim-colorizer.lua', event = "BufReadPre", config = function() require('colorizer').setup() end}
  -- Smooth Scrolling
  use({
    "karb94/neoscroll.nvim",
    keys = {"<C-u>", "<C-d>", "gg", "G"},
    config = function() require("plugins.neoscroll") end
  })
  use({"edluffy/specs.nvim", after = "neoscroll.nvim", config = function() require("plugins.specs") end})

  -- Syntax
  use {'neovim/nvim-lspconfig', opt = true, event = "BufReadPre", config = function() require('plugins.lspconfig') end}
  use {
	  'nvim-treesitter/nvim-treesitter',
	  opt = true,
	  event = "BufRead",
	  run = ':TSUpdate',
	  config = function() require('plugins.treesitter') end,
	  requires = { 'nvim-treesitter/nvim-treesitter-textobjects' }
  }

  -- Editing
  use({
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opt = true,
    config = function() require("plugins.cmp") end,
    requires = {
      "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-vsnip", "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-emoji", {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end}
    }
  })
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-endwise'
  use 'tpope/vim-commentary'
  use {'windwp/nvim-ts-autotag', config = function() require("plugins.autotag") end, after = "nvim-treesitter"}
  use 'christoomey/vim-sort-motion'

  -- Project navigation
  use {
    'kyazdani42/nvim-tree.lua',
	wants = "nvim-web-devicons",
    config = function() require('plugins.tree') end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end
  }
  use {'folke/todo-comments.nvim', wants = "telescope.nvim", config = function() require('plugins.todo-comments') end}

  -- File navigation
  use 'easymotion/vim-easymotion'
  -- use 'mg979/vim-visual-multi'

  -- Task running
  use {'janko/vim-test', requires = 'preservim/vimux'}

  -- Git
  use 'tpope/vim-fugitive'

  -- Tmux
  use 'christoomey/vim-tmux-navigator'

  -- Wakatime
  use 'wakatime/vim-wakatime'

end)

vim.cmd [[
  let g:test#javascript#runner = 'jest'
  let g:test#javascript#jest#file_pattern = '\v(__tests__/.*|(spec|test))\.(js|jsx|coffee|ts|tsx)$'
  let test#strategy = "vimux"
]]
