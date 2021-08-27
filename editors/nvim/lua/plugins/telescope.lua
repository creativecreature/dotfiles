local actions = require('telescope.actions')require('telescope').setup{
  defaults = {
    mappings = {
      -- Close on escape
      i = {
        ["<esc>"] = actions.close,
      },
    },
  }
}
