local theme = os.getenv("THEME") or "dark"
if theme == 'dark' then
  require("palenightfall").setup()
  vim.o.background = "dark"
end

if theme == 'light' then
  vim.o.background = "light"
  vim.cmd.colorscheme("catppuccin-latte")
end
