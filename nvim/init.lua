local cmd = vim.cmd

cmd([[
	let g:loaded_ruby_provider = 0
]])

require("settings")
require("keybindings")
require("autocommands")
require("plugin")
require("theme")
