let mapleader = ","
set shell=zsh " Set zsh as the prompt for vim
set backspace=2 " Backspace deletes in insertmode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler " Always show cursor position
set showcmd " Display incomplete commands
set laststatus=2 " Always displays the status line
set noshowmode
set timeoutlen=1000
set ttimeoutlen=0
set expandtab
set scrolloff=3
set list listchars=tab:»·,trail:·  " Display extra whitespace characters
set hidden
set inccommand=nosplit
set number relativenumber
set nu rnu
set cmdheight=2 " Give more space for displaying messages.

" Indentation
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2 " number of spaces to use for autoindenting
set expandtab " insert space characters whenever tab key is pressed
set tabstop=2 " number of space characters to insert when tab is pressed
set softtabstop=2 " <Tab> and <BS> inserts and deletes right amount of spaces
function TabToggle()
  if &expandtab
    set shiftwidth=4
    set softtabstop=0
    set noexpandtab
  else
    set shiftwidth=2
    set softtabstop=2
    set expandtab
  endif
endfunction
nmap <leader><tab> mz:execute TabToggle()<CR>'z

" Show tabs and spaces
function ListToggle()
  if &list
    set nolist
  else
    set list listchars=tab:»·,trail:·  " Display extra whitespace characters
  endif
endfunction
nmap <leader>> mz:execute ListToggle()<CR>'z

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" Line numbers
set number
set numberwidth=5

" Highlight search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Open new split panes to right and bottom
set splitbelow
set splitright

" Grep with ripgrep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m
endif

" Enable folding
set foldmethod=indent
set foldlevel=99

" This makes coc vim diagnostic messages work better
set updatetime=300
" Don't give |ins-completion-menu| messages. Coc vim
set shortmess+=c
set signcolumn=yes

if has("autocmd")
  filetype plugin indent on

  " Resize vim windows when window size changes, usually caused by opening a
  " tmux split
  autocmd VimResized * :wincmd =

  autocmd BufReadPost * " {{{2
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif "}}}2

  " Automatically clean trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
        \ | set textwidth=0

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead,BufNewFile *.scssm set filetype=scss

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig
  autocmd BufEnter *.tsx set filetype=typescript.tsx

  autocmd BufEnter * set foldmethod=indent

endif

" UI
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set t_ut=                " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html
" if has("termguicolors")  " set true colors
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"     set termguicolors
" endif
set termguicolors
" set background=dark
colorscheme palenight
" colorscheme nova
" colorscheme night-owl
" let g:nova_transparent = 1
" colorscheme nova
"
let no_buffers_menu=1

function! s:highlight_helper(...)
  let l:syntax_group = a:1
  let l:foreground_color = a:2
  let l:background_color = empty(a:3) ? "NONE" : a:3
  let l:gui = a:0 == 3 ? "None" : a:4
  exec "highlight " . l:syntax_group . " guifg=" . l:foreground_color . " guibg=" . l:background_color . " gui=" . l:gui . " cterm=NONE term=NONE"
endfunction

hi ActiveWindow guibg=#292D3E
hi InactiveWindow guibg=#252837

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
  autocmd WinLeave * call Handle_Win_Exit()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

function! Handle_Win_Exit()
  setlocal winhighlight=Normal:InactiveWindow,NormalNC:InactiveWindow
endfunction

nnoremap <silent> <leader>o :call Handle_Win_Exit()<CR>
nnoremap <silent> <leader>O :call Handle_Win_Enter()<CR>

" TODO Eventually move these to the colorscheme
call s:highlight_helper("TabLine", "#697098", "#252837")
call s:highlight_helper("TabLineSel", "#bfc7d5", "#252837")
call s:highlight_helper("TabLineFill", "#bfc7d5", "#252837")
