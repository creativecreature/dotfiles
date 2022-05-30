local actions = require('telescope.actions')

require('telescope').load_extension('fzf')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {["<esc>"] = actions.close} -- Close on escape
    }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {["<c-d>"] = require("telescope.actions").delete_buffer},
        n = {["<c-d>"] = require("telescope.actions").delete_buffer}
      }
    }
  }
}
