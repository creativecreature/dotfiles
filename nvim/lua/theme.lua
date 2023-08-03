local theme = string.sub(vim.fn.system("tmux show-environment THEME"), 7):gsub("%s+$", "")

if theme == "dark" then
  require("palenightfall").setup()
  vim.o.background = "dark"
end

if theme == "light" then
  vim.o.background = "light"
  vim.cmd.colorscheme("catppuccin-latte")
end
