require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
	ignore_install = { "phpdoc" }, -- This won't install cleanly and causes errors
  highlight = {enable = true, disable = {}, additional_vim_regex_highlighting = true},
  indent = {enable = true, disable = {}},
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
