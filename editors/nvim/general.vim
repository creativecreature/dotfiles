let mapleader = ","
set shell=zsh " Set zsh as the prompt for vim
set backspace=2 " Backspace deletes in insertmode
set nobackup
set nowritebackup
set noswapfile
set history=10000
set ruler " Always show cursor position
set showcmd " Display incomplete commands
set laststatus=2 " Always displays the status line
set noshowmode
set timeoutlen=1000
set ttimeoutlen=0
set scrolloff=3
set list listchars=tab:»·,trail:·  " Display extra whitespace characters
set hidden
set inccommand=nosplit
set number relativenumber
set nu rnu
set cmdheight=2 " Give more space for displaying messages.
set mouse=a " Enables scrolling in the error popups, usefull for coc-vim.

" Indentation
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2 " number of spaces to use for autoindenting
set tabstop=2 " number of space characters to insert when tab is pressed
set softtabstop=2 " <Tab> and <BS> inserts and deletes right amount of spaces
set expandtab " insert space characters whenever tab key is pressed
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

  " autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
  "       \ | set textwidth=0

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead,BufNewFile *.scssm set filetype=scss

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig
  autocmd BufEnter *.tsx set filetype=typescript.tsx

  autocmd BufEnter * set foldmethod=indent
  au BufRead,BufNewFile Jenkinsfile setfiletype groovy

endif

" UI
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme creativecreature

let no_buffers_menu=1

hi ActiveWindow guibg=#292d3d
hi InactiveWindow guibg=#252837
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
augroup colortoggle
  autocmd!
  autocmd BufEnter,FocusGained * setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  autocmd BufLeave,FocusLost * setlocal winhighlight=Normal:InactiveWindow,NormalNC:InactiveWindow
augroup END

" TODO Eventually move this to some helper file
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nmap <leader><leader>h mz:execute SynGroup()<CR>
