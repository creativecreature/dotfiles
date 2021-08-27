local api = vim.api
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local opt = vim.opt

opt.shell=zsh -- Set zsh as the prompt for vim
opt.backspace=2 -- Backspace deletes in insertmode
opt.nobackup=true
opt.nowritebackup=true
opt.noswapfile=true
opt.history=10000
opt.ruler=true -- Always show cursor position
opt.showcmd=true -- Display incomplete commands
opt.laststatus=2 -- Always displays the status line
opt.noshowmode=true
opt.timeoutlen=1000
opt.ttimeoutlen=0
opt.scrolloff=3
opt.list listchars=tab:»·,trail:·  -- Display extra whitespace characters
opt.hidden=true
opt.inccommand=nosplit
opt.number relativenumber
opt.nu rnu
opt.cmdheight=2 -- Give more space for displaying messages.
