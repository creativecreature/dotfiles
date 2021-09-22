local nvim_lsp = require('lspconfig')
local fn = vim.fn

-- Add language servers
local function on_attach(client, bufnr)
  if client.config.flags then client.config.flags.allow_incremental_sync = true end

  -- TypeScript specific stuff
  if client.name == "typescript" or client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
end

local servers = {"pyright", "rust_analyzer", "tsserver", "solargraph", "vimls", "dockerls", "bashls", "rust_analyzer"}
for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach, flags = {debounce_text_changes = 150}} end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup {capabilities = capabilities}

require'lspconfig'.cssls.setup {capabilities = capabilities}

-- Configure language server for lua
USER = vim.fn.expand('$USER')
local sumneko_root_path = "/home/" .. USER .. "/lua-language-server"
local sumneko_binary = "/home/" .. USER .. "/lua-language-server/bin/Linux/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
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

-- Configure EFM
local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {'%f:%l:%c: %m'},
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true,
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

-- Setup diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  underline = true,
  signs = true
})

-- Setup the icons
local icons = {
  Error = '',
  Warning = '',
  Hint = '',
  Information = ''
}

for type, icon in pairs(icons) do
  local hl = 'LspDiagnosticsSign' .. type
  fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
