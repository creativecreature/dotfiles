local cmd = vim.cmd
local g = vim.g
local map = vim.api.nvim_set_keymap

-- Set space as the leader key
g.mapleader = " "

--Bind leader p to always paste the latest yank
map('n', '<Leader>p', '"0p', { noremap = true })

--Make Y yank to the end of line (similar to how D deletes to end of line and C changes to end of line)
map('n', 'Y', 'y$', { noremap = true })

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


--Search mappings: These will make it so that going to the next one in a
--search will center on the line it's found in.
map('n', 'n', 'nzzzv', { noremap = true })
map('n', 'N', 'Nzzzv', { noremap = true })

--Don't move the cursor when joining lines.
map('n', 'J', 'mzJ`z', { noremap = true })

--Undo breakpoints. Pressing u will take these breakpoints into consideration.
cmd [[
  inoremap , ,<c-g>u
  inoremap . .<c-g>u
  inoremap ! !<c-g>u
  inoremap ? ?<c-g>u
]]

--Mutate the jumplist when we move more than 5 lines
cmd [[
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]]

--Split
map('n', ',x', ':<C-u>split<CR>', { noremap = true })
map('n', ',v', ':<C-u>vsplit<CR>', { noremap = true })

--Buffer nav
map('n', ',q', ':bp<CR>', { noremap = true })
map('n', ',w', ':bn<CR>', { noremap = true })
map('n', ',c', ':bp<CR>:bd #<CR>', { noremap = true })

-- Clean search highlight
map('n', ',<space>', ':noh<CR>', { noremap = true })

--Vmap for maintain Visual Mode after shifting > and <
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })

--Move visual block
map('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
map('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })

-- Find the cursor word definition and reference
map('n', 'gh', '<cmd>lua require\'lspsaga.provider\'.lsp_finder()<CR>', { noremap = true })

-- Code actions
map('n', '<leader>f', '<cmd>lua require(\'lspsaga.codeaction\').code_action()<CR>', { noremap = true })
map('v', '<leader>f', ':<C-U>lua require(\'lspsaga.codeaction\').range_code_action()<CR>', { noremap = true })

-- Show hover doc
map('n', 'K', '<cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>', { noremap = true })

-- Scroll preview windows
map('n', '<C-f>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', { noremap = true })
map('n', '<C-b>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', { noremap = true })

-- Rename
map('n', 'gr', '<cmd>lua require(\'lspsaga.rename\').rename()<CR>', { noremap = true })

-- Preview definition
map('n', 'gD', '<cmd>lua require\'lspsaga.provider\'.preview_definition()<CR>', { noremap = true })

-- Go to definition
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })

-- Go to implementation
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true })

-- Navigate errors
map('n', '<A-k>', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_prev()<CR>', { noremap = true })
map('n', '<A-j>', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_next()<CR>', { noremap = true })

-- Format buffer
map('n', '=f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true })

-- Telescope
map('n', '<C-p>', '<cmd>Telescope find_files<cr>', { noremap = true })
map('n', '\\', '<cmd>Telescope buffers<cr>', { noremap = true })

-- Tab completion
cmd [[
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]]

-- Open nerdtree
cmd [[
  nnoremap <silent> <F2> :NERDTreeFind<CR>
  nnoremap <silent> <F3> :NERDTreeToggle<CR>
  let g:NERDTreeMapOpenVSplit = '<C-v>'
  let g:NERDTreeMapOpenSplit = '<C-x>'
  let g:NERDTreeWinSize = 50
]]
