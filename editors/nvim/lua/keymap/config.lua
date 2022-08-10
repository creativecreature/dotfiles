local keymap = require('core.keymap')
local nmap, imap, vmap = keymap.nmap, keymap.imap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- normal mode
nmap({
	-- yank
	{ 'Y', 'y$', opts(noremap) },
	-- buffer nav
	{ ']b', cmd('bn'), opts(noremap) },
	{ '[b', cmd('bp'), opts(noremap) },
	{ ',q', cmd('bp'), opts(noremap) },
	{ ',w', cmd('bn'), opts(noremap) },
	{ ',c', ':bp<CR>:bd #<CR>', opts(noremap) },

	-- Copy buffer path
	{ 'cp', ':let @* = expand("%")<cr>', opts(noremap) },

	-- search will center on the line it's found in.
	{ 'n', 'nzzzv', opts(noremap) },
	{ 'N', 'Nzzzv', opts(noremap) },

	-- Don't move the cursor when joining lines.
	{ 'J', 'mzJ`z', opts(noremap) },

	-- Split
	{ ',x', ':<C-u>split<CR>', opts(noremap) },
	{ ',v', ':<C-u>vsplit<CR>', opts(noremap) },

	-- Clean search highlight
	{ ',<space>', ':noh<CR>', opts(noremap, silent) },

	-- Move visual block
	{ 'J', ':m \'>+1<CR>gv=gv', opts(noremap) },
	{ 'K', ':m \'<-2<CR>gv=gv', opts(noremap) },
})

-- insert mode
imap({
	{ '<C-h>', '<Bs>', opts(noremap) },
	{ '<C-e>', '<End>', opts(noremap) },
})

-- visul mode
vmap({
	-- Vmap for maintain Visual Mode after shifting > and <
	{ '<', '<gv', opts(noremap) },
	{ '>', '>gv', opts(noremap) },

	-- Move visual block
	{ 'J', ':m \'>+1<CR>gv=gv', opts(noremap) },
	{ 'K', ':m \'<-2<CR>gv=gv', opts(noremap) },
})


-- ============  TODO ==============
-- Undo breakpoints. Pressing u will take these breakpoints into consideration.
vim.cmd [[
  inoremap , ,<c-g>u
  inoremap . .<c-g>u
  inoremap ! !<c-g>u
  inoremap ? ?<c-g>u
]]

-- Mutate the jumplist when we move more than 5 lines
vim.cmd [[
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]]
