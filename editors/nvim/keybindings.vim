" Smarter pasting
if has('macunix')
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Bind leader p to always paste the latest yank
nnoremap <Leader>p "0p

" Make Y yank to the end of line (similar to how D deletes to end of line and C changes to end of line)
nnoremap Y y$

"Smart indent when entering insert mode with i on empty lines
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_ddO"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move the cursor when joining lines.
nnoremap J mzJ`z

" Undo breakpoints. Pressing u will take these breakpoints into consideration.
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Mutate the jumplist when we move more than 5 lines
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Split
noremap <Leader>x :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Buffer nav
noremap <silent><leader>q :bp<CR>
noremap <silent><leader>w :bn<CR>

" Close buffer, small fix for nerdtree bug see https://github.com/preservim/nerdtree/issues/400
noremap <leader>c :bp<cr>:bd #<cr>

"Clean search highlight
nnoremap <silent> <leader><space> :noh<cr>

" Zoom and rebalance vim panes
nnoremap <leader>Z :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>z :wincmd =<cr>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Enable folding with the spacebar
nnoremap <space> za

" Map gF to go to file in vertical split
nnoremap gF :vertical wincmd f<CR>
