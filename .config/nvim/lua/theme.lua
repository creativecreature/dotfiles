local theme = string.sub(vim.fn.system("tmux show-environment THEME"), 7):gsub("%s+$", "")

if theme == "dark" then
	local material = require("material")
	material.setup({})
	vim.o.background = "dark"
	vim.cmd("colorscheme tokyonight")
end

if theme == "light" then
	local material = require("material")
	material.setup({
		custom_colors = function(colors)
			colors.editor.fg = "#213B47"
			colors.editor.fg_dark = "#61747D"
		end,
	})
	vim.o.background = "light"
	vim.g.material_style = "lighter"
	vim.cmd.colorscheme("material")
end
