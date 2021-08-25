local saga = require 'lspsaga'

saga.init_lsp_saga {
  use_saga_diagnostic_sign = true,
  border_style = 'round',
  dianostic_header_icon = '💣 ',
  error_sign = '🔥',
  warn_sign = '💩',
  hint_sign = '🐛',
  infor_sign = '💡',
  definition_preview_icon = ' ',
  code_action_icon = '✨',
  code_action_prompt = {
    enable = true,
    sign = false,
    sign_priority = 20,
    virtual_text = true,
  },
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
    quit = 'q',exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  },
  rename_prompt_prefix = '➤',
}
