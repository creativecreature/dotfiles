local api = vim.api

-- Auto compile the plugins whenever we do changes
api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

-- Resize vim windows when window size changes, usually caused by opening a tmux split
api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	command = "wincmd =",
})

-- Automatically clean trailing whitespace
api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

-- Set filetype to markdown for .md files and enable spell check
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.md",
	command = "set filetype=markdown",
})

api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	command = "setlocal spell spelllang=en_us",
})

-- Set filetype to json for various configuration files
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { ".eslintrc", ".jscsrc", ".jshintrc", ".babelrc" },
	command = "set ft=json",
})

-- Set filetype to scss for .scss and .scssm files
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.scss",
	command = "set filetype=scss",
})

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.scssm",
	command = "set filetype=scss",
})

-- Set filetype to .gitconfig for gitconfig files
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "gitconfig",
	command = "set ft=.gitconfig",
})

-- Set filetype to typescript.tsx for .tsx files
api.nvim_create_autocmd("BufEnter", {
	pattern = "*.tsx",
	command = "set filetype=typescript.tsx",
})
