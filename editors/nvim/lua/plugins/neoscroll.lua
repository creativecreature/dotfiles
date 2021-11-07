require("neoscroll").setup({})
local map = {}

map["<C-u>"] = {"scroll", {"-vim.wo.scroll", "true", "80"}}
map["<C-d>"] = {"scroll", {"vim.wo.scroll", "true", "80"}}
map["zt"] = {"zt", {"150"}}
map["zz"] = {"zz", {"150"}}
map["zb"] = {"zb", {"150"}}

require("neoscroll.config").set_mappings(map)
