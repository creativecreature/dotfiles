vim.cmd([[
  let g:test#javascript#runner = 'jest'
  let g:test#javascript#jest#file_pattern = '\v(__tests__/.*|(spec|test))\.(js|jsx|coffee|ts|tsx)$'
  let test#strategy = "vimux"
]])


-- Run tests from monorepo root
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufEnter", {
	pattern = "**.test.ts",
	callback = function()
		match = string.match(vim.fn.expand("%:p"), ".+/apps/graphql")
		if match then
      print("Setting test path")
			vim.g["test#project_root"] = match
		end
	end,
})
