call plug#begin()

" User interface
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'ap/vim-buftabline'
Plug 'chrisbra/Colorizer'

" Project navigation
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug '~/code/creativecreature/themer'
Plug 'ervandew/supertab'

" File navigation
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-sort-motion'
Plug 'michaeljsmith/vim-indent-object'

" Task Running
Plug 'janko/vim-test'
Plug 'benmills/vimux'

" Git
Plug 'tpope/vim-fugitive'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" Kick bad habits
Plug 'takac/vim-hardtime'

" Wakatime
Plug 'wakatime/vim-wakatime'

call plug#end()
