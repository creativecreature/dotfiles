return {
	"windwp/nvim-ts-autotag",
	dependencies = {
		"nvim-treesitter",
	},
	config = function()
		local autotag = require("nvim-ts-autotag")
		autotag.setup({
			filetypes = { "typescript.tsx", "xml", "html", "javascript", "typescript", "javascript.jsx" },
		})
	end,
}
