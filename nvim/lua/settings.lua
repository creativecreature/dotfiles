local cmd = vim.cmd
local opt = vim.opt

-- Disable some of the builtin plugins.
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

opt.updatetime = 200 -- Decrease update time
opt.shell = "zsh" -- Set zsh as the prompt for vim
opt.history = 10000 -- Increase the history
opt.swapfile = false -- Dont use swap files
opt.hidden = true -- Enable modified buffers in background
opt.cmdheight = 2 -- Give more space for displaying messages.
opt.inccommand = "nosplit" -- Show % substitution changes without having to hit enter
opt.showmode = false -- Dont show the mode because I use a statusline
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.undolevels = 1000 -- Allow for more undos(at the cost of increased memory usage)
vim.o.completeopt = "menuone,noselect"

-- Line numbers
opt.number = true -- Show the current line as the real line number
opt.relativenumber = true -- Show other lines relative to the current line

-- Indentation
vim.opt.list = false -- Disable list chars by default.
vim.opt.listchars =
	{ eol = "↲", tab = "▸ ", trail = "·", multispace = "▫", extends = "▶", precedes = "◀", nbsp = "‿" }

opt.shiftwidth = 2 -- Number of spaces to use for autoindenting
opt.tabstop = 2 -- Number of space characters to insert when tab is pressed
opt.softtabstop = 2 -- <Tab> and <BS> inserts and deletes right amount of spaces
opt.expandtab = true -- Insert space characters whenever tab key is pressed

-- Use tabs
opt.tabstop = 2 -- Number of spaces that a tab counts for
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.expandtab = false -- Use actual tabs, not spaces

-- Better copy pasting
opt.clipboard = "unnamed,unnamedplus"

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true -- Searches wrap the buffer

-- Open new split panes to right and bottom
opt.splitbelow = true
opt.splitright = true

-- Auto completion
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup

-- Enable folding
opt.foldmethod = "indent"
opt.foldlevel = 99

-- UI
opt.termguicolors = true

-- dw (delete word) will delete word with hyphens, e.g "some-word" gets deleted by having the cursor on s and pressing dw
cmd([[
  set iskeyword+=-
]])
