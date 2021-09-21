local saga = require 'lspsaga'

saga.init_lsp_saga {
  use_saga_diagnostic_sign = true,
  border_style = 'round',
  dianostic_header_icon = '💣 ',
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  definition_preview_icon = ' ',
  code_action_icon = '✨',
  code_action_prompt = {enable = true, sign = false, sign_priority = 20, virtual_text = true},
  code_action_keys = {quit = '<esc>', exec = '<CR>'},
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = '<cr>',
    vsplit = 's',
    split = 'i',
    quit = '<esc>',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>'
  },
  rename_action_keys = {
    quit = '<esc>',
    exec = '<CR>'
  },
  rename_prompt_prefix = '➤'
}
