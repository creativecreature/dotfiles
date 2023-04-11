vim.o.completeopt = "menuone,noselect"

-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	preselect = cmp.PreselectMode.None,
	mapping = {
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
	},
	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "emoji" },
	},
	window = {
		completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
		documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
	},
	-- The prioritize comparator causes copilot entries to appear higher in the cmp menu
	sorting = {
		priority_weight = 2,
		comparators = {
			require("copilot_cmp.comparators").prioritize,
			-- Below is the default comparator list and order for nvim-cmp
			cmp.config.compare.offset,
			-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})
