local cmd = vim.cmd

cmd [[
  " auto compile the plugins whenever we do changes
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile

  " Resize vim windows when window size changes, usually caused by opening a " tmux split
  autocmd VimResized * :wincmd =

  " Automatically clean trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufEnter markdown setlocal spell spelllang=en_us

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead,BufNewFile *.scssm set filetype=scss

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig
  autocmd BufEnter *.tsx set filetype=typescript.tsx

  au BufRead,BufNewFile Jenkinsfile setfiletype groovy

  " Configure active pane colors
  set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  augroup ChangeBackgroudColour
    autocmd colorscheme * :hi VertSplit ctermbg=NONE guibg=#24283b
    autocmd colorscheme * :hi VertSplit ctermfg=NONE guifg=#24283b
    autocmd colorscheme * :hi NvimTreeNormal guibg=#24283b
    " autocmd colorscheme * :hi NvimTreeRootFolder guifg=bg guibg=bg
  augroup END
  augroup colortoggle
    autocmd!
    autocmd BufEnter,FocusGained * setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
    autocmd BufLeave,FocusLost * setlocal winhighlight=Normal:InactiveWindow,NormalNC:InactiveWindow
  augroup END
]]
