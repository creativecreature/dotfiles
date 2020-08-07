" Smarter pasting
if has('macunix')
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Smart indent when entering insert mode with i on empty lines
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

" Switching windows
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
" noremap <C-h> <C-w>h

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
