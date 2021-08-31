local api = vim.api
local fn = vim.fn

-- Setup packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

-- Install plugins
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- UI
  use 'creativecreature/themer'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require('plugins.lualine') end
  }
  use 'folke/tokyonight.nvim'
  use {'folke/twilight.nvim', config = function() require('plugins.twilight') end}
  use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end}

  -- Syntax
  use {'neovim/nvim-lspconfig', config = function() require('plugins.lspconfig') end}
  use {'glepnir/lspsaga.nvim', config = function() require('plugins.lspsaga') end}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('plugins.treesitter') end}
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Editing
  use({
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    opt = true,
    config = function() require("plugins.compe") end,
    requires = {{"windwp/nvim-autopairs", config = function() require("plugins.autopairs") end}}
  })
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-endwise'
  use 'tpope/vim-commentary'
  use 'alvan/vim-closetag'
  -- use 'jiangmiao/auto-pairs'
  use 'christoomey/vim-sort-motion'

  -- Project navigation
  use 'scrooloose/nerdtree'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end
  }

  -- File navigation
  use 'easymotion/vim-easymotion'
  use 'terryma/vim-multiple-cursors'

  -- Task running
  use 'janko/vim-test'
  use 'preservim/vimux'

  -- Git
  use 'tpope/vim-fugitive'

  -- Tmux
  use 'christoomey/vim-tmux-navigator'

  -- Wakatime
  use 'wakatime/vim-wakatime'

end)

vim.cmd [[
  let g:NERDTreeShowHidden=1
]]
