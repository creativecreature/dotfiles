local cmd = vim.cmd

cmd([[
	let g:loaded_ruby_provider = 0
]])

require("settings")
require("plugins")
require("keybindings")
require("autocommands")
require("theme")

cmd([[
let g:go_fmt_command = "golines"
let g:go_fmt_options = {
    \ 'golines': '-m 120',
    \ }
]])
