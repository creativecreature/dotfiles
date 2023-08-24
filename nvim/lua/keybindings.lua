local function cmd(str)
	return '<cmd>' .. str .. '<CR>'
end

-- Use space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- =============================================================================
-- === NORMAL MODE =============================================================
-- =============================================================================
-- Toggle list chars
vim.keymap.set({ 'n' }, '<Leader><tab>', ':set list!<CR>', { silent = true, desc = "[t]oggle list chars" })

-- Yank Line
vim.keymap.set({ 'n' }, 'Y', 'y$', { silent = true, desc = "[Y]ank line" })

-- Copy path to buffer
vim.keymap.set({ 'n' }, 'cp', ':let @* = expand("%")<CR>', { silent = true, desc = "[c]opy [p]ath to buffer" })

-- Search will center on the line it found
vim.keymap.set({ 'n' }, 'n', 'nzzzv', { silent = true, desc = "Next search result" })
vim.keymap.set({ 'n' }, 'N', 'Nzzzv', { silent = true, desc = "Previous search result" })

-- Don't move the cursor when joining lines.
vim.keymap.set({ 'n' }, 'J', 'mzJ`z', { silent = true, desc = "[J]oin lines" })

-- Split
vim.keymap.set({ 'n' }, ',x', ':<C-u>split<CR>', { silent = true, desc = "Horizontal split" })
vim.keymap.set({ 'n' }, ',v', ':<C-u>vsplit<CR>', { silent = true, desc = "[V]ertical split" })

-- Clean search highlight
vim.keymap.set({ 'n' }, ',<space>', ':noh<CR>', { silent = true, desc = "Clean search highlight" })

-- =============================================================================
-- === NORMAL MODE PLUGINS =====================================================
-- =============================================================================
-- Packer
vim.keymap.set({ 'n' }, '<Leader>pu', cmd('PackerUpdate'), { silent = true, desc = "[P]acker [u]pdate" })
vim.keymap.set({ 'n' }, '<Leader>pi', cmd('PackerInstall'), { silent = true, desc = "[P]acker [i]nstall" })
vim.keymap.set({ 'n' }, '<Leader>pc', cmd('PackerCompile'), { silent = true, desc = "[P]acker [c]ompile" })

vim.keymap.set({ 'n' }, '<A-k>', cmd('lua vim.diagnostic.goto_prev()'), { silent = true, desc = "Go to previous error" })
vim.keymap.set({ 'n' }, '<A-j>', cmd('lua vim.diagnostic.goto_next()'), { silent = true, desc = "Go to next error" })

-- Filetree
vim.keymap.set({ 'n' }, '<F2>', cmd('NvimTreeFindFile'), { silent = true, desc = "Find file in filetree" })
vim.keymap.set({ 'n' }, '<F3>', cmd('NvimTreeToggle'), { silent = true, desc = "Toggle filetree" })

-- Telescope
local find_command = "{ 'rg', '--files', '--hidden', '-g', '!node_modules/**', '-g', '!.git/**', }"
vim.keymap.set({ 'n' }, '<Leader>b', cmd('Telescope buffers'), { silent = true, desc = "List open [b]uffers" })
vim.keymap.set({ 'n' }, '<Leader>fa', cmd('Telescope live_grep'), { silent = true, desc = "[F]ind [a]ll matches" })
vim.keymap.set({ 'n' }, '<Leader>ff', cmd('Telescope find_files'), { silent = true, desc = "[F]ind [f]iles" })
vim.keymap.set({ 'n' }, '<Leader>ds', cmd('Telescope lsp_document_symbols'), { silent = true, desc = "Find [d]ocument [s]ymbol" })
vim.keymap.set({ 'n' }, '<Leader>sd', cmd('Telescope diagnostics'), { silent = true, desc = "[S]ee [d]iagnostics" })
vim.keymap.set({ 'n' }, 'gr', cmd('lua require\'telescope.builtin\'.lsp_references{}'), { silent = true })
vim.keymap.set({ 'n' }, 'gd', cmd('lua require\'telescope.builtin\'.lsp_definitions{}'), { silent = true })
vim.keymap.set({ 'n' }, 'gD', cmd('lua require\'telescope.builtin\'.lsp_definitions{jump_type = "vsplit"}'),
	{ silent = true })
vim.keymap.set({ 'n' }, 'gX', cmd('lua require\'telescope.builtin\'.lsp_definitions{jump_type = "split"}'),
	{ silent = true })
vim.keymap.set({ 'n' }, '<C-p>',
	cmd('lua require(\'telescope.builtin\').find_files({find_command = ' .. find_command .. ' })'), { silent = true })
vim.keymap.set({ 'n' }, '\\', cmd('Telescope buffers'), { silent = true })
vim.keymap.set({ 'n' }, '<Leader>/', cmd('lua require("telescope").extensions.live_grep_args.live_grep_args()'),
	{ silent = true })

-- Todo comments
vim.keymap.set({ 'n' }, '|', cmd('TodoTelescope'), { silent = true })

-- Fugitive
vim.keymap.set({ 'n' }, '<Leader>gs', cmd('G'), { silent = true })
vim.keymap.set({ 'n' }, '<Leader>gd', cmd('Gvdiffsplit'), { silent = true })
vim.keymap.set({ 'n' }, '<Leader>gp', cmd('Git pull'), { silent = true })
vim.keymap.set({ 'n' }, '<Leader>gh', cmd('0Gclog'), { silent = true })
vim.keymap.set({ 'n' }, 'dv', cmd('Gdiff'), { silent = true })

-- Git worktree
vim.keymap.set({ 'n' }, '<Leader>gw', cmd('lua require(\'telescope\').extensions.git_worktree.git_worktrees()'),
	{ silent = true })
vim.keymap.set({ 'n' }, '<Leader>gc', cmd('lua require(\'telescope\').extensions.git_worktree.create_git_worktree()'),
	{ silent = true })

-- Vim test
vim.keymap.set({ 'n' }, 'tn', cmd('TestNearest'), { silent = true })
vim.keymap.set({ 'n' }, 'tf', cmd('TestFile'), { silent = true })
vim.keymap.set({ 'n' }, 'ts', cmd('TestSuite'), { silent = true })


-- =============================================================================
-- === VISUAL MODE =============================================================
-- =============================================================================
--  Maintain visual mode after shifting > and <
vim.keymap.set({ 'v' }, '<', '<gv', { silent = true })
vim.keymap.set({ 'v' }, '>', '>gv', { silent = true })

-- Move visual block
vim.keymap.set({ 'v' }, 'K', ':m \'<-2<CR>gv=gv', { silent = true })
vim.keymap.set({ 'v' }, 'J', ':m \'>+1<CR>gv=gv', { silent = true })


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
