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

	" Set typescript errors in quickfix
  augroup makeTS
    autocmd FileType typescript,typescriptreact compiler tsc | setlocal makeprg=npx\ tsc
  augroup END
]]
