local cmd = vim.cmd
cmd [[
	let g:loaded_python_provider = 0
	let g:python3_host_prog = '/usr/bin/python3'
	let g:node_host_prog = '/Users/conner/.volta/bin/node'
]]
require('plugins')
require('settings')
require('keybindings')
require('autocommands')
