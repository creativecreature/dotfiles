require("neodev").setup({})
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local function on_attach() end

-- Setup mason so it can manage external tooling
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local mason_lspconfig = require("mason-lspconfig")

-- Ensure that the servers below are installed
local servers = {
	tsserver = {},
	gopls = {},
	bashls = {},
	dockerls = {},
	vimls = {},
	cssls = {},
	html = {},
	eslint = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})
-- Automatically update diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = false,
	severity_sort = true,
	signs = true,
})

-- Setup the diagnostics icons
local function lspSymbol(name, icon)
	vim.fn.sign_define("DiagnosticSign" .. name, { text = icon, numhl = "DiagnosticDefault" .. name })
end

lspSymbol("Error", "󰅙")
lspSymbol("Warning", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")

-- Configure the look for all floating previews
-- For more info see: https://github-wiki-see.page/m/neovim/nvim-lspconfig/wiki/UI-customization
local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

lspconfig.gopls.setup({
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
})

local null_ls = require("null-ls")
-- TODO: Find a way to install these with Mason
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.actionlint,
		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.diagnostics.commitlint,
		null_ls.builtins.diagnostics.gitlint,
		null_ls.builtins.diagnostics.misspell,
		null_ls.builtins.diagnostics.write_good,
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.formatting.cbfmt,
		null_ls.builtins.formatting.jq,
		null_ls.builtins.formatting.markdownlint,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.formatting.stylua,
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "=f", vim.lsp.buf.format, opts)
		vim.keymap.set("n", "<Leader>f", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		-- make gq work with lsp
		vim.api.nvim_buf_set_option(ev.buf, "formatexpr", "")
	end,
})

-- vim.lsp.set_log_level("debug")
