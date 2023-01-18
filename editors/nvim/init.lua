local cmd = vim.cmd

cmd [[
	let g:loaded_ruby_provider = 0
]]

require('settings')
require('plugins')
require('keybindings')
require('autocommands')

