local actions = require('telescope.actions')

require('telescope').load_extension('fzf')

require('telescope').setup {
  defaults = {
    mappings = {
      -- Close on escape
      i = {["<esc>"] = actions.close}
    }
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {["<c-d>"] = require("telescope.actions").delete_buffer},
        n = {["<c-d>"] = require("telescope.actions").delete_buffer}
      }
    }
  }
}
