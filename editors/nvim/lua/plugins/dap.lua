local dap = require("dap")
local sep_os_replacer = require("util").sep_os_replacer
local path_sep = package.config:sub(1, 1)
local dap_path = vim.fn.stdpath("data") .. path_sep .. "dapinstall"
local map = vim.api.nvim_set_keymap

dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define("DapBreakpoint", {text = "🛑", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped", {text = "🟢", texthl = "", linehl = "", numhl = ""})

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {sep_os_replacer(dap_path .. "/jsnode/vscode-node-debug2/out/src/nodeDebug.js")}
}

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {sep_os_replacer(dap_path .. "/chrome/vscode-chrome-debug/out/src/chromeDebug.js")}
}

map('n', '<leader>dh', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map('n', '<c-k>', ':lua require"dap".step_out()<CR>')
map('n', '<c-l>', ':lua require"dap".step_into()<CR>')
map('n', '<c-j>', ':lua require"dap".step_over()<CR>')
map('n', '<c-h>', ':lua require"dap".continue()<CR>')
map('n', '<leader>dk', ':lua require"dap".up()<CR>')
map('n', '<leader>dj', ':lua require"dap".down()<CR>')
map('n', '<leader>dc', ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>')
map('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
map('n', '<leader>di', ':lua require"dap.ui.variables".hover()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.variables".visual_hover()<CR>')
map('n', '<leader>d?', ':lua require"dap.ui.variables".scopes()<CR>')
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

require('telescope').load_extension('dap')
map('n', '<leader>ds', ':Telescope dap frames<CR>')
-- map('n', '<leader>dc', ':Telescope dap commands<CR>')
map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')

dap.configurations.typescriptreact = {
  {
    type = "chrome",
    name = "Launch Chrome Debugger",
    request = "launch",
    url = "localhost:3000",
    webRoot = "${workspaceRoot}",
    userDataDir = false,
    sourceMapPathOverrides = {
      -- Sourcemap override for nextjs
      ["webpack://_N_E/./*"] = "${webRoot}/*",
      ["webpack:///./*"] = "${webRoot}/*"
    }
  },
  {
    type = "chrome",
    name = "Chrome Attach",
    request = "attach",
    webRoot = "${workspaceRoot}",
    port = 9222,
    sourceMapPathOverrides = {
      -- Sourcemap override for nextjs
      ["webpack://_N_E/./*"] = "${webRoot}/*",
      ["webpack:///./*"] = "${webRoot}/*"
    }
  }
}

dap.configurations.typescript = {
  {
    type = "node2",
    name = "node attach",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector"
  }
}

require("dapui").setup()
