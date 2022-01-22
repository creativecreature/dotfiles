local function on_attach(client)
  -- TypeScript specific stuff
  if client.name == "typescript" or client.name == "tsserver" then
    -- This makes sure tsserver is not used for formatting (I prefer prettier)
    client.resolved_capabilities.document_formatting = false
  end
end

local servers = {
  tsserver = {},
  pyright = {},
  vimls = {},
  dockerls = {},
  bashls = {},
  html = {},
  jsonls = {},
  cssls = {},
  gopls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'}
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
        }
      }
    }
  }
}

-- Configure EFM
local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {'%f:%l:%c: %m'},
  -- formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true
}

local luaFormat = {
  formatCommand = "lua-format -i --keep-simple-control-block-one-line --keep-simple-function-one-line --column-limit=120 --indent-width=2 --tab-width=2 --continuation-indent-width=2",
  formatStdin = true
}

require"lspconfig".efm.setup {
  init_options = {documentFormatting = true},
  filetypes = {
    "lua", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescript.tsx", "typescriptreact"
  },
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {luaFormat},
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint}
    }
  }
}

-- Automatically update diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = false,
  severity_sort = true,
  signs = true
})

-- Setup the icons
local function lspSymbol(name, icon)
  vim.fn.sign_define('DiagnosticSign' .. name, {text = icon, numhl = 'DiagnosticDefault' .. name})
end
lspSymbol('Error', '')
lspSymbol('Warning', '')
lspSymbol('Hint', '')
lspSymbol('Information', '')

-- Configure to looks for all floating previews
-- For more info see: https://github-wiki-see.page/m/neovim/nvim-lspconfig/wiki/UI-customization
local border = {
  {"╭", "FloatBorder"}, {"─", "FloatBorder"}, {"╮", "FloatBorder"}, {"│", "FloatBorder"},
  {"╯", "FloatBorder"}, {"─", "FloatBorder"}, {"╰", "FloatBorder"}, {"│", "FloatBorder"}
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- require'cmp'.setup {sources = {{name = 'nvim_lsp'}}}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local options = {on_attach = on_attach, capabilities = capabilities, flags = {debounce_text_changes = 150}}
require("plugins.lsp-installer").setup(servers, options)
