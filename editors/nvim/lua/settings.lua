local cmd = vim.cmd
local opt = vim.opt

opt.shell = 'zsh' -- Set zsh as the prompt for vim
opt.history = 10000 -- Increase the history
opt.swapfile = false -- Dont use swap files
opt.hidden = true -- Enable modified buffers in background
opt.cmdheight = 2 -- Give more space for displaying messages.
opt.inccommand = 'nosplit' -- Show % substitution changes without having to hit enter
opt.showmode = false -- Dont show the mode because I use a statusline
vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.undolevels = 1000 -- Allow for more undos(at the cost of increased memory usage)

-- Line numbers
opt.number = true -- Show the current line as the real line number
opt.relativenumber = true -- Show other lines relative to the current line

-- Indentation
-- opt.shiftwidth=2 -- Number of spaces to use for autoindenting
-- opt.tabstop=2 -- Number of space characters to insert when tab is pressed
-- opt.softtabstop=2 -- <Tab> and <BS> inserts and deletes right amount of spaces
-- opt.expandtab=true -- Insert space characters whenever tab key is pressed

-- Indent with tabs
vim.cmd [[
  set autoindent
  set noexpandtab
  set tabstop=2
  set shiftwidth=2
]]

-- Better copy pasting
opt.clipboard = 'unnamed,unnamedplus'

-- Searching
opt.ignorecase = true
opt.smartcase = true

-- Open new split panes to right and bottom
opt.splitbelow = true
opt.splitright = true

-- Auto completion
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup

-- Enable folding
opt.foldmethod = 'indent'
opt.foldlevel = 99

-- UI
opt.termguicolors = true
opt.background = 'dark'
cmd [[
  colorscheme tokyonight
]]
-- dw (delete word) will delete word with hyphens, e.g "some-word" gets deleted by having the cursor on s and pressing dw
cmd [[
	set iskeyword+=-
]]
