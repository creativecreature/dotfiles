local config = {}

-- config server in this function
function config.nvim_lsp()
	local lspconfig = require('lspconfig')

	local function on_attach(client)
		-- We are going to use EFM to format typescript/javascript files
		if client.name == "typescript" or client.name == "tsserver" then
			client.resolved_capabilities.document_formatting = false
		end
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
				typescriptreact = { eslint }
			}
		}
	}

	-- Setup lua-dev supports which provides information about the neovim API's
	local luadev = require("lua-dev").setup({})
	lspconfig.sumneko_lua.setup(luadev)
end

function config.nvim_cmp()
	vim.o.completeopt = "menuone,noselect"

	-- Setup nvim-cmp.
	local cmp = require("cmp")

	cmp.setup({
		snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
		preselect = cmp.PreselectMode.None,
		mapping = {
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
			['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
			['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = 'luasnip' },
			{ name = "buffer" },
			{ name = "path" },
			{ name = 'emoji' }
		},
		window = {
			-- completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
			documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
		},
		experimental = { ghost_text = { hl_group = "LineNr" } }
	})
end

function config.lua_snip()
	local ls = require('luasnip')
	local types = require('luasnip.util.types')
	ls.config.set_config({
		history = true,
		enable_autosnippets = true,
		updateevents = 'TextChanged,TextChangedI',
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { '<- choiceNode', 'Comment' } },
				},
			},
		},
	})
	require('luasnip.loaders.from_lua').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets' })
	require('luasnip.loaders.from_vscode').lazy_load()
	require('luasnip.loaders.from_vscode').lazy_load({
		paths = { './snippets/' },
	})
end

function config.autopairs()
	local autopairs = require("nvim-autopairs")
	autopairs.setup({ map_cr = false })
end

function config.autotag()
	require('nvim-ts-autotag').setup({
		filetypes = { "typescript.tsx", "xml", "html", "javascript", "typescript", "javascript.jsx" }
	})
end

return config
