" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>" " Tab top down instead of top up

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <Leader>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Easymotion
map <Leader>/ <Plug>(incsearch-easymotion-/)
map <Leader>? <Plug>(incsearch-easymotion-?)
map <Leader>g/ <Plug>(incsearch-easymotion-stay)

" Fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>h :FzfHistory<CR>
nnoremap <Leader>t :FzfBTags<CR>
nnoremap <Leader>T :FzfTags<CR>
nnoremap <C-p> :FzfFiles<CR>

" Gutentags
let g:gutentags_file_list_command = "rg --files --follow --ignore-file '~/.config/nvim/.vimignore'"

" Nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 50
let g:NERDTreeMapOpenVSplit = '<C-v>'
let g:NERDTreeMapOpenSplit = '<C-x>'
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" Ale
let g:ale_sign_error = '🔥'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '🙀'
hi ALEWarningSign guifg=#F2C38F
let g:ale_linters = {'javascript': ['eslint']}
" ALT-k and ALT-j to navigate errors
nmap <silent> ˚ <Plug>(ale_previous_wrap)
nmap <silent> ∆ <Plug>(ale_next_wrap)

" Indentline
" This is to display ` and "
let g:indentLine_setConceal = 2
let g:indentLine_concealcursor = ""

" Prettier
nmap =p <Plug>(Prettier)
let g:prettier#config#single_quote = 'true'

" Lightline
" let g:lightline = { 'colorscheme': 'palenight' }
let g:lightline = { 'colorscheme': 'nord' }

" Vim-test
let g:test#javascript#mocha#file_pattern = '.*\.test\.js'
let test#strategy = 'vimux'
