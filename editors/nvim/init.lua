local cmd = vim.cmd
cmd [[
	let g:loaded_ruby_provider = 0
]]
require('plugins')
require('settings')
require('keybindings')
require('autocommands')
