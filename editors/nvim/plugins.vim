call plug#begin()

" User interface
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'creativecreature/nvim-lightline-lsp'
Plug '~/code/creativecreature/themer'

" Syntax
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'

" Editing
" Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'folke/twilight.nvim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-sort-motion'
Plug 'michaeljsmith/vim-indent-object'

" Project navigation
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" File navigation
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" Task Running
Plug 'janko/vim-test'
Plug 'preservim/vimux'

" Git
Plug 'tpope/vim-fugitive'
Plug 'TimUntersberger/neogit'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" Wakatime
Plug 'wakatime/vim-wakatime'

call plug#end()
