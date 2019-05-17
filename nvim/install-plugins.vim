let vim_plug = stdpath('data').'/site/autoload/plug.vim'
if empty(glob(vim_plug))
  echo 'Installing vim-plug'
  silent execute '!curl -fLo '.vim_plug.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
let vim_plugins = stdpath('data').'/plugged'
if empty(glob(vim_plugins))
  echo 'Syncing plugins'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

