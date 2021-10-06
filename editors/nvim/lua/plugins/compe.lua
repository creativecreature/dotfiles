-- NVIM compe
vim.o.completeopt = "menuone,noselect"
local util = require("util")

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  min_length = 1;
  preselect = "enable", -- "always" would select the first item and require enter to complete to it
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = false; -- This shows the file extension when trying to require/import javascript/typescript files.
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = false;
    vsnip = false; -- https://github.com/hrsh7th/vim-vsnip
    ultisnips = false;
    luasnip = false;
    emoji = true;
    spell = true;
  };
}

local function complete()
  if vim.fn.pumvisible() == 1 then
    return vim.fn["compe#confirm"]({ keys = "<cr>", select = true })
  else
    return require("nvim-autopairs").autopairs_cr()
  end
end

util.imap("<CR>", complete, { expr = true })
vim.cmd([[autocmd User CompeConfirmDone silent! lua vim.lsp.buf.signature_help()]])
