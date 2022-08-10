local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin { 'easymotion/vim-easymotion' }
plugin { 'christoomey/vim-tmux-navigator' }
plugin { 'wakatime/vim-wakatime' }

plugin { 'vim-test/vim-test', requires = { 'preservim/vimux' }, config = conf.vim_test }
