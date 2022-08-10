local use = require('core.pack').register_use
local conf = require('modules.editing.config')

use({
	'hrsh7th/nvim-cmp',
	config = conf.nvim_cmp,
	requires = {
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-path', after = 'nvim-cmp' },
		{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
		{ 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
	},
})

use({
	'neovim/nvim-lspconfig',
	config = conf.nvim_lsp,
	requires = {
		{ "folke/lua-dev.nvim" },
		{ "williamboman/nvim-lsp-installer" },
	},
})


use({ 'L3MON4D3/LuaSnip', config = conf.lua_snip })

use({ 'windwp/nvim-autopairs', config = conf.autopairs, after = 'nvim-cmp' })
use({ 'windwp/nvim-ts-autotag', config = conf.autopairs, after = 'nvim-treesitter' })

use { 'tpope/vim-repeat' }
use { 'tpope/vim-surround' }
use { 'tpope/vim-endwise' }
use { 'tpope/vim-commentary' }

use { 'christoomey/vim-sort-motion' }
