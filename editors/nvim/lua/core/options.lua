local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'
local opt = vim.opt
local cmd = vim.cmd

opt.shell = 'zsh' -- Set zsh as the prompt for vim
opt.history = 10000 -- Increase the history
opt.swapfile = false -- Dont use swap files
opt.hidden = true -- Enable modified buffers in background
opt.cmdheight = 2 -- Give more space for displaying messages.
opt.inccommand = 'nosplit' -- Show % substitution changes without having to hit enter
opt.showmode = false -- Dont show the mode because I use a statusline
opt.joinspaces = false -- No double spaces with join after a dot
opt.undolevels = 1000 -- Allow for more undos(at the cost of increased memory usage)
opt.encoding = 'utf-8'

-- Line numbers
opt.number = true -- Show the current line as the real line number
opt.relativenumber = true -- Show other lines relative to the current line

-- Better copy pasting
opt.clipboard = 'unnamed,unnamedplus'

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.magic = true

-- Open new split panes to right and bottom
opt.splitbelow = true
opt.splitright = true

-- Auto completion
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup

-- Enable folding
opt.foldmethod = 'indent'
opt.foldlevel = 99

opt.directory = cache_dir .. 'swag/'
opt.undodir = cache_dir .. 'undo/'
opt.backupdir = cache_dir .. 'backup/'
opt.viewdir = cache_dir .. 'view/'
opt.spellfile = cache_dir .. 'spell/en.uft-8.add'


opt.updatetime = 100
opt.redrawtime = 1500


-- Indent with tabs
cmd [[
  set autoindent
  set noexpandtab
  set tabstop=2
  set shiftwidth=2
]]

cmd [[
  function! IndentWithI()
    if len(getline('.')) == 0
      return "\"_ddO"
    else
      return "i"
    endif
  endfunction
  nnoremap <expr> i IndentWithI()
]]

-- dw (delete word) will delete word with hyphens, e.g "some-word" gets deleted by having the cursor on s and pressing dw
cmd [[
	set iskeyword+=-
]]


opt.termguicolors = true
