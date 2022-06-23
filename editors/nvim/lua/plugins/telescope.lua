local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.load_extension('fzf')
telescope.load_extension("live_grep_args")

telescope.setup {
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
