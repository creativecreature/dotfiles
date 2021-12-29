vim.cmd [[
  let g:test#javascript#runner = 'jest'
  let g:test#javascript#jest#file_pattern = '\v(__tests__/.*|(spec|test))\.(js|jsx|coffee|ts|tsx)$'
  let test#strategy = "vimux"
]]
