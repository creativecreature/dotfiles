" Smarter pasting
nnoremap <Leader>p :set invpaste paste?<CR>
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
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

" Close buffer
noremap <leader>c :bd<CR>

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

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind - to grep and show result in quickfix
command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
nnoremap - :Rg<SPACE>

" Enable folding with the spacebar
nnoremap <space> za

" Map gF to go to file in vertical split
nnoremap gF :vertical wincmd f<CR>

