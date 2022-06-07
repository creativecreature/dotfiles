vim.o.completeopt = "menuone,noselect"

-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
	},
	sources = { { name = "nvim_lsp" }, { name = "nvim_lua" }, { name = 'luasnip' }, { name = "buffer" }, { name = "path" }, { name = 'emoji' } },
	window = {
		documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
	},
	experimental = { ghost_text = { hl_group = "LineNr" } }
})
