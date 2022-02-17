local cmd = vim.cmd
local g = vim.g
local map = vim.api.nvim_set_keymap

-- Set space as the leader key
g.mapleader = " "

-- Bind leader p to always paste the latest yank
map('n', '<Leader>p', '"0p', {noremap = true})

-- Make Y yank to the end of line (similar to how D deletes to end of line and C changes to end of line)
map('n', 'Y', 'y$', {noremap = true})

-- Smart indent when entering insert mode with i on empty lines
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

-- Copy buffers relative path
map('n', 'cp', ':let @* = expand("%")<cr>', {noremap = true})

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
map('n', 'n', 'nzzzv', {noremap = true})
map('n', 'N', 'Nzzzv', {noremap = true})

-- Don't move the cursor when joining lines.
map('n', 'J', 'mzJ`z', {noremap = true})

-- Undo breakpoints. Pressing u will take these breakpoints into consideration.
cmd [[
  inoremap , ,<c-g>u
  inoremap . .<c-g>u
  inoremap ! !<c-g>u
  inoremap ? ?<c-g>u
]]

-- Mutate the jumplist when we move more than 5 lines
cmd [[
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]]

-- Split
map('n', ',x', ':<C-u>split<CR>', {noremap = true})
map('n', ',v', ':<C-u>vsplit<CR>', {noremap = true})

-- Buffer nav
map('n', ',q', ':bp<CR>', {noremap = true})
map('n', ',w', ':bn<CR>', {noremap = true})
map('n', ',c', ':bp<CR>:bd #<CR>', {noremap = true})

-- Clean search highlight
map('n', ',<space>', ':noh<CR>', {noremap = true})

-- Vmap for maintain Visual Mode after shifting > and <
map('v', '<', '<gv', {noremap = true})
map('v', '>', '>gv', {noremap = true})

-- Move visual block
map('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
map('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true})

-- Git
map('n', '<leader>gs', ':G<CR>', {noremap = true}) -- Git status
map('n', '<leader>gd', ':Gvdiffsplit<CR>', {noremap = true}) -- Git status
map('n', '<leader>gp', ':Git pull<CR>', {noremap = true}) -- Git status
map('n', '<leader>gw', ':lua require(\'telescope\').extensions.git_worktree.git_worktrees()<CR>', {noremap = true}) -- Choose work tree
map('n', '<leader>gc', ':lua require(\'telescope\').extensions.git_worktree.create_git_worktree()<CR>', {noremap = true}) -- Choose work tree

-- Find the cursor word definition and reference
map('n', 'gh', '<cmd>lua require\'telescope.builtin\'.lsp_references{}<CR>', {noremap = true})

-- Code actions
map('n', '<leader>f', '<cmd>lua require\'telescope.builtin\'.lsp_code_actions{}<CR>', {noremap = true})
map('v', '<leader>f', '<cmd>lua require\'telescope.builtin\'.lsp_range_code_actions{}<CR>', {noremap = true})

-- Show hover doc
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})

-- Rename
map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true})

-- Go to definition
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
map('n', 'gd', '<cmd>lua require\'telescope.builtin\'.lsp_definitions{}<CR>', {noremap = true})
map('n', 'gD', '<cmd>lua require\'telescope.builtin\'.lsp_definitions{jump_type = "vsplit"}<CR>', {noremap = true})
map('n', 'gX', '<cmd>lua require\'telescope.builtin\'.lsp_definitions{jump_type = "split"}<CR>', {noremap = true})
map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true})

-- Go to implementation
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true})

-- Navigate errors
map('n', '<A-k>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true})
map('n', '<A-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true})

-- Format buffer
map('n', '=f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true})

-- Telescope
local find_command = "{ 'rg', '--files', '--hidden', '-g', '!node_modules/**', '-g', '!.git/**', }"
map('n', '<C-p>', '<cmd>lua require(\'telescope.builtin\').find_files({find_command = ' .. find_command .. ' })<cr>',
    {noremap = true})
map('n', '\\', '<cmd>Telescope buffers<cr>', {noremap = true})

-- Live grep
map('n', '<leader>/', '<cmd>Telescope live_grep<cr>', {noremap = true})

-- Todo comments
map('n', '|', '<cmd>TodoTelescope<cr>', {noremap = true})

-- nvim-tree
map('n', '<F2>', '<cmd> NvimTreeFindFile<CR>', {noremap = true})
map('n', '<F3>', '<cmd> NvimTreeToggle<CR>', {noremap = true})

-- Test nearest
map('n', 'tn', '<cmd>TestNearest<CR>', {noremap = true})
-- Test file
map('n', 'tf', '<cmd>TestFile<CR>', {noremap = true})
-- Test suite
map('n', 'ts', '<cmd>TestSuite<CR>', {noremap = true})
