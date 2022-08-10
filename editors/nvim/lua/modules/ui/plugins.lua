local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin({ 'folke/tokyonight.nvim', config = conf.tokyonight })
plugin({
	'glepnir/galaxyline.nvim',
	branch = 'main',
	config = conf.galaxyline,
	requires = 'kyazdani42/nvim-web-devicons',
})

plugin ({ 'norcalli/nvim-colorizer.lua', event = "BufReadPre", config = conf.colorizer})
