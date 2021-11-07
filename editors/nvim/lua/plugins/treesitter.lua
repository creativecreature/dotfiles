require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {enable = true, disable = {}},
  indent = {enable = false, disable = {}},
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      }
    }
  }
}

local parser_config = require"nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = {"javascript", "typescript.tsx"}

