local function cmd(str)
	return "<cmd>" .. str .. "<CR>"
end

-- Use space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =============================================================================
-- === NORMAL MODE =============================================================
-- =============================================================================
-- Toggle list chars
vim.keymap.set({ "n" }, "<Leader><tab>", ":set list!<CR>", { silent = true })

-- Yank Line
vim.keymap.set({ "n" }, "Y", "y$", { silent = true })

-- Copy path to buffer
vim.keymap.set({ "n" }, "cp", ':let @* = expand("%")<CR>', { silent = true })

-- Search will center on the line it found
vim.keymap.set({ "n" }, "n", "nzzzv", { silent = true })
vim.keymap.set({ "n" }, "N", "Nzzzv", { silent = true })

-- Don't move the cursor when joining lines.
vim.keymap.set({ "n" }, "J", "mzJ`z", { silent = true })

-- Split
vim.keymap.set({ "n" }, ",x", ":<C-u>split<CR>", { silent = true })
vim.keymap.set({ "n" }, ",v", ":<C-u>vsplit<CR>", { silent = true })

-- Clean search highlight
vim.keymap.set({ "n" }, ",<space>", ":noh<CR>", { silent = true })

-- Navigate diagnostics
vim.keymap.set({ "n" }, "<A-[>", cmd("lua vim.diagnostic.goto_prev()"), { silent = true })
vim.keymap.set({ "n" }, "<A-]>", cmd("lua vim.diagnostic.goto_next()"), { silent = true })

-- =============================================================================
-- === NORMAL MODE PLUGINS =====================================================
-- =============================================================================

vim.keymap.set({ "n" }, "<F2>", cmd("NvimTreeFindFileToggle!"), { silent = true })
vim.keymap.set({ "n" }, "<F3>", cmd("NvimTreeToggle"), { silent = true })

-- Telescope
local find_command = "{ 'rg', '--files', '--hidden', '-g', '!node_modules/**', '-g', '!.git/**', }"
vim.keymap.set({ "n" }, "<Leader>b", cmd("Telescope buffers"), { silent = true })
vim.keymap.set({ "n" }, "<Leader>fa", cmd("Telescope live_grep"), { silent = true })
vim.keymap.set({ "n" }, "<Leader>ff", cmd("Telescope find_files"), { silent = true })
vim.keymap.set({ "n" }, "<Leader>ds", cmd("Telescope lsp_document_symbols"), { silent = true })
vim.keymap.set({ "n" }, "<Leader>sd", cmd("Telescope diagnostics"), { silent = true })
vim.keymap.set({ "n" }, "gr", cmd("lua require'telescope.builtin'.lsp_references{}"), { silent = true })
vim.keymap.set({ "n" }, "gd", cmd("lua require'telescope.builtin'.lsp_definitions{}"), { silent = true })
vim.keymap.set(
	{ "n" },
	"gD",
	cmd("lua require'telescope.builtin'.lsp_definitions{jump_type = \"vsplit\"}"),
	{ silent = true }
)
vim.keymap.set(
	{ "n" },
	"gX",
	cmd("lua require'telescope.builtin'.lsp_definitions{jump_type = \"split\"}"),
	{ silent = true }
)
vim.keymap.set(
	{ "n" },
	"<C-p>",
	cmd("lua require('telescope.builtin').find_files({find_command = " .. find_command .. " })"),
	{ silent = true }
)
vim.keymap.set({ "n" }, "\\", cmd("Telescope buffers"), { silent = true })
vim.keymap.set(
	{ "n" },
	"<Leader>/",
	cmd('lua require("telescope").extensions.live_grep_args.live_grep_args()'),
	{ silent = true }
)

-- Todo comments
vim.keymap.set({ "n" }, "|", cmd("TodoTelescope"), { silent = true })

-- Fugitive
vim.keymap.set({ "n" }, "<Leader>gs", cmd("G"), { silent = true })
vim.keymap.set({ "n" }, "<Leader>gd", cmd("Gvdiffsplit"), { silent = true })
vim.keymap.set({ "n" }, "<Leader>gp", cmd("Git pull"), { silent = true })
vim.keymap.set({ "n" }, "<Leader>gh", cmd("0Gclog"), { silent = true })
vim.keymap.set({ "n" }, "dv", cmd("Gdiff"), { silent = true })

-- Git worktree
vim.keymap.set(
	{ "n" },
	"<Leader>gw",
	cmd("lua require('telescope').extensions.git_worktree.git_worktrees()"),
	{ silent = true }
)
vim.keymap.set(
	{ "n" },
	"<Leader>gc",
	cmd("lua require('telescope').extensions.git_worktree.create_git_worktree()"),
	{ silent = true }
)

-- Vim test
vim.keymap.set({ "n" }, "tn", cmd("TestNearest"), { silent = true })
vim.keymap.set({ "n" }, "tf", cmd("TestFile"), { silent = true })
vim.keymap.set({ "n" }, "ts", cmd("TestSuite"), { silent = true })

-- =============================================================================
-- === VISUAL MODE =============================================================
-- =============================================================================
--  Maintain visual mode after shifting > and <
vim.keymap.set({ "v" }, "<", "<gv", { silent = true })
vim.keymap.set({ "v" }, ">", ">gv", { silent = true })

-- Move visual block
vim.keymap.set({ "v" }, "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set({ "v" }, "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Undo breakpoints. Pressing u will take these breakpoints into consideration.
vim.cmd([[
  inoremap , ,<c-g>u
  inoremap . .<c-g>u
  inoremap ! !<c-g>u
  inoremap ? ?<c-g>u
]])

-- Mutate the jumplist when we move more than 5 lines
vim.cmd([[
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]])
