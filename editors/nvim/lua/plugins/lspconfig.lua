require("neodev").setup({})
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. See the documentation for more information.
local servers = {
	tsserver = {},
	gopls = {},
	bashls = {},
	dockerls = {},
	vimls = {},
	pyright = {},
	cssls = {},
	html = {},
	sumneko_lua = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function on_attach(client)
	-- We are going to use EFM to format typescript/javascript files
	if client.name == "typescript" or client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end
end

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

-- Automatically update diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = false,
	severity_sort = true,
	signs = true
})

-- Setup the diagnostics icons
local function lspSymbol(name, icon)
	vim.fn.sign_define('DiagnosticSign' .. name, { text = icon, numhl = 'DiagnosticDefault' .. name })
end

lspSymbol('Error', '')
lspSymbol('Warning', '')
lspSymbol('Hint', '')
lspSymbol('Information', '')

-- Configure the look for all floating previews
-- For more info see: https://github-wiki-see.page/m/neovim/nvim-lspconfig/wiki/UI-customization
local border = {
	{ "╭", "FloatBorder" }, { "─", "FloatBorder" }, { "╮", "FloatBorder" }, { "│", "FloatBorder" },
	{ "╯", "FloatBorder" }, { "─", "FloatBorder" }, { "╰", "FloatBorder" }, { "│", "FloatBorder" }
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Configure EFM to do the formatting for JS/TS files.
local eslint = {
	lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = { '%f:%l:%c: %m' },
	-- formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
	formatCommand = "prettier --stdin-filepath ${INPUT}",
	formatStdin = true
}

lspconfig.efm.setup {
	init_options = { documentFormatting = true },
	filetypes = {
		"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescript.tsx", "typescriptreact"
	},
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			javascript = { eslint },
			javascriptreact = { eslint },
			["javascript.jsx"] = { eslint },
			typescript = { eslint },
			["typescript.tsx"] = { eslint },
			typescriptreact = { eslint },
		}
	}
}

lspconfig.gopls.setup {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			gofumpt = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			env = {
				GOFLAGS = "-tags=windows,linux,darwin,integration",
			},
		},
	},
}
