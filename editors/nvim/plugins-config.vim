" Nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 50
let g:NERDTreeMapOpenVSplit = '<C-v>'
let g:NERDTreeMapOpenSplit = '<C-x>'
let g:NERDTreeShowHidden=1
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" Vim-test
let g:test#javascript#jest#file_pattern = '.*\.test\.js'
let g:test#typescript#mocha#file_pattern = '.*\.test\.ts'
let g:test#javascript#mocha#file_pattern = '.*\.test\.ts'
let g:test#javascript#mocha#executable = 'yarn test'
let g:test#typescript#mocha#executable = 'yarn test'
let test#strategy = 'vimux'

" Vim close-tag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php, *.jsx, *.js, *.tsx"

" Ripgrep
" bind CTRL-f to grep word under cursor and show results in quickfix
nnoremap <C-f> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind - to grep and show result in quickfix
command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
nnoremap - :Rg<SPACE>

" LSP
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-y>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap("n", "=f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- This disables showing inline errors. I use LSP saga to display them on hover
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local servers = { "pyright", "rust_analyzer", "tsserver", "solargraph", "vimls", "dockerls", "bashls", "rust_analyzer" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename', '--single-quote', '--print-width 120', '--no-semi', '--trailing-comma all' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'prettier',
      javascriptreact = 'prettier',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'eslint_d',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}

-- LSP Saga
local saga = require 'lspsaga'
saga.init_lsp_saga {
  use_saga_diagnostic_sign = true,
  border_style = 'round',
  dianostic_header_icon = '💣 ',
  error_sign = '🔥',
  warn_sign = '💩',
  hint_sign = '🐛',
  infor_sign = '💡',
  definition_preview_icon = ' ',
  code_action_icon = '✨',
  code_action_prompt = {
    enable = true,
    sign = false,
    sign_priority = 20,
    virtual_text = true,
  },
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
    quit = 'q',exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  },
  rename_prompt_prefix = '➤',
}

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

--- Telescope
local actions = require('telescope.actions')require('telescope').setup{
  defaults = {
    mappings = {
      -- Close on escape
      i = {
        ["<esc>"] = actions.close,
      },
    },
  }
}

-- Twilight
require("twilight").setup {
  dimming = {
    alpha = 0.25, -- amount of dimming
    -- we try to get the foreground from the highlight groups or fallback color
    color = { "Normal", "#ffffff" },
  },
  context = 10, -- amount of lines we will try to show around the current line
  -- treesitter is used to automatically expand the visible text,
  -- but you can further control the types of nodes that should always be fully expanded
  expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {}, -- exclude these filetypes
}

-- NVIM compe
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = false;
    vsnip = false;
    ultisnips = false;
    luasnip = true;
    emoji = true;
  };
}

require('lualine').setup({
    options = {
      icons_enabled = true,
      theme = 'tokyonight',
      component_separators = { '', ' '},
      section_separators = { '', '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = {
        {
          'diagnostics',
          sources = { 'nvim_lsp' },
          symbols = {
            hint = '  ',
            error = ' 🔥 '
          },
          sections = { 'error', 'warn', 'info', 'hint' },
        },
        'progress',
      },
      lualine_y = { 'filetype' },
      lualine_z = { 'location' }
    }
  })

EOF

" === LSP Saga =================================================================
nnoremap <silent>K :Lspsaga hover_doc<CR>
" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" code action
nnoremap <silent><leader>f <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>f :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

" show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" rename
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>

" preview definition
nnoremap <silent> gD <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

" ALT-k and ALT-j to navigate errors
if system('uname -s') == "Darwin\n"
  "OSX
  nmap <silent> <M-k> <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
  nmap <silent> <M-j> <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
else
  "Linux
  nmap <silent> <A-k> <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
  nmap <silent> <A-j> <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
endif


" === COMPLETION ===============================================================
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" === TELESCOPE ================================================================
nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
" nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
" nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
" highlight TelescopeSelection guifg=#212431 guibg=#d4d7e2
" highlight TelescopeMatching guifg=#ff8599
