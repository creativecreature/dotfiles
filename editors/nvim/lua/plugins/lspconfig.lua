local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local function on_attach(client)
	-- We are going to use EFM to format typescript/javascript files
	if client.name == "typescript" or client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Define the language servers we want to use and initialize them.
local servers = {
	"tsserver", "pyright", "vimls", "dockerls", "bashls", "html", "jsonls", "cssls", "gopls", "sumneko_lua"
}
local lspinstaller = require("nvim-lsp-installer")
lspinstaller.setup { ensure_installed = servers }
for _, server in ipairs(lspinstaller.get_installed_servers()) do
	lspconfig[server.name].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 150 }
	}
end

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
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

-- Setup lua-dev supports which provides information about the neovim API's
local neodev = require("neodev").setup({})
lspconfig.sumneko_lua.setup(neodev)
