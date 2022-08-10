local config = {}

function config.tokyonight()
	vim.opt.termguicolors = true
	vim.opt.background = 'dark'
	vim.cmd('colorscheme tokyonight')
end

function config.galaxyline()
	require('modules.ui.eviline')
end

function config.colorizer()
	local colorizer = require('colorizer')
	colorizer.setup()
end

return config
