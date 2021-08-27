local cmd = vim.cmd
local opt = vim.opt

opt.shell='zsh' -- Set zsh as the prompt for vim
opt.history=10000
-- opt.noshowmode=true -- Hide the mode in the cmd window
vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
opt.hidden=true
cmd [[
  set noshowmode
  set noswapfile
]]
opt.numberwidth=5
opt.cmdheight=2 -- Give more space for displaying messages.
opt.inccommand='nosplit' -- Show % substitution changes without having to hit enter
opt.number=true
opt.relativenumber=true

-- Indentation
opt.shiftwidth=2 -- number of spaces to use for autoindenting
opt.tabstop=2 -- number of space characters to insert when tab is pressed
opt.softtabstop=2 -- <Tab> and <BS> inserts and deletes right amount of spaces
opt.expandtab=true -- insert space characters whenever tab key is pressed

-- Better copy pasting
opt.clipboard='unnamed,unnamedplus'
-- Searching
opt.ignorecase=true
opt.smartcase=true

-- Open new split panes to right and bottom
opt.splitbelow=true
opt.splitright=true

-- Enable folding
opt.foldmethod='indent'
opt.foldlevel=99

-- UI
opt.termguicolors = true
opt.background = 'dark'
cmd [[
  colorscheme tokyonight
  hi ActiveWindow guibg=#24283b
  hi InactiveWindow guibg=#1f2335
  set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
]]
