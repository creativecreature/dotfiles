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
" ALT-k and ALT-j to navigate errors
nmap <silent> <A-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <A-j> <Plug>(coc-diagnostic-next)

" Surround vim
" Deletes surrounding function
nmap <silent> dsf ds)db

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

" Indentline
" This is to display ` and "
let g:indentLine_setConceal = 2
let g:indentLine_concealcursor = ""

" Prettier
nmap =p <Plug>(Prettier)
let g:prettier#config#single_quote = 'true'

" Lightline
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'coc-status', 'readonly', 'filename', 'modified', 'coc_error', 'coc_warning', 'coc_hint', 'coc_info' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
  \ 'component_expand': {
  \   'coc_error'        : 'LightlineCocErrors',
  \   'coc_warning'      : 'LightlineCocWarnings',
  \   'coc_info'         : 'LightlineCocInfos',
  \   'coc_hint'         : 'LightlineCocHints',
  \   'coc_fix'          : 'LightlineCocFixes',
  \ }
      \ }
let g:lightline.component_type = {
\   'coc_error'        : 'error',
\   'coc_warning'      : 'warning',
\   'coc_info'         : 'tabsel',
\   'coc_hint'         : 'middle',
\   'coc_fix'          : 'middle',
\ }

let g:coc_user_config = {}
let g:coc_user_config['diagnostic'] = {}
let g:coc_user_config['diagnostic']['infoSign'] = "💩"
let g:coc_user_config['diagnostic']['errorSign'] = "🔥"


function! s:lightline_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][join([a:sign, 'Sign'], '')]
  catch
    let s = join([a:sign, 'Sign'], '')
  endtry
  " return printf('%s', a:sign)
  return printf('%s %d', s, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Vim-test
let g:test#javascript#mocha#file_pattern = '.*\.test\.js'
let test#strategy = 'vimux'

" Vim close-tag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php, *.jsx, *.js"

" Hardtime
let g:hardtime_timeout = 5000
