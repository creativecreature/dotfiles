require('keymap.config')
local key = require('core.keymap')
local nmap = key.nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd

local find_command = "{ 'rg', '--files', '--hidden', '-g', '!node_modules/**', '-g', '!.git/**', }"

-- TODO:  I think its nicer to put a keybindings file in the modules directory
nmap({
	-- packer
	{ '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
	{ '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
	{ '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },

	--  lsp
	{ '<Leader>f', cmd('lua vim.lsp.buf.code_action()'), opts(noremap) },
	{ 'K', cmd('lua vim.lsp.buf.hover()'), opts(noremap) },
	{ 'gt', cmd('lua vim.lsp.buf.type_definition()'), opts(noremap) },
	{ 'gi', cmd('lua vim.lsp.buf.implementation()'), opts(noremap) },
	{ '<A-k>', cmd('lua vim.diagnostic.goto_prev()'), opts(noremap) },
	{ '<A-j>', cmd('lua vim.diagnostic.goto_next()'), opts(noremap) },
	{ '=f', cmd('lua vim.lsp.buf.formatting()'), opts(noremap) },

	-- dashboard
	{ '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
	{ '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
	{ '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },

	-- nvimtree
	{ '<F2>', cmd('NvimTreeFindFile'), opts(noremap) },
	{ '<F3>', cmd('NvimTreeToggle'), opts(noremap) },

	-- Telescope
	{ '<Leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
	{ '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
	{ '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
	{ 'gr', cmd('lua require\'telescope.builtin\'.lsp_references{}'), opts(noremap) },
	{ 'gd', cmd('lua require\'telescope.builtin\'.lsp_definitions{}'), opts(noremap) },
	{ 'gD', cmd('lua require\'telescope.builtin\'.lsp_definitions{jump_type = "vsplit"}'), opts(noremap) },
	{ 'gX', cmd('lua require\'telescope.builtin\'.lsp_definitions{jump_type = "split"}'), opts(noremap) },
	{ '<C-p>', cmd('lua require(\'telescope.builtin\').find_files({find_command = ' .. find_command .. ' })'), opts(noremap) },
	{ '\\', cmd('Telescope buffers'), opts(noremap) },
	{ '<Leader>/', cmd('lua require("telescope").extensions.live_grep_args.live_grep_args()'), opts(noremap) },

	-- Todo comments
	{ '|', cmd('TodoTelescope'), opts(noremap) },

	-- Fugitive
	{ '<Leader>gs', cmd('G'), opts(noremap) },
	{ '<Leader>gd', cmd('Gvdiffsplit'), opts(noremap) },
	{ '<Leader>gp', cmd('Git pull'), opts(noremap) },

	-- Git worktree
	{ '<Leader>gw', cmd('lua require(\'telescope\').extensions.git_worktree.git_worktrees()'), opts(noremap) },
	{ '<Leader>gc', cmd('lua require(\'telescope\').extensions.git_worktree.create_git_worktree()'), opts(noremap) },

	-- Vim test
	{ 'tn', cmd('TestNearest'), opts(noremap) },
	{ 'tf', cmd('TestFile'), opts(noremap) },
	{ 'ts', cmd('TestSuite'), opts(noremap) },
})
