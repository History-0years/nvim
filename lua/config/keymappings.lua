-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- shorten options
local opts = { noremap = true, silent = true }


--   Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",

-- Normal & Visual mode --

-- avoid accidental misuse
-- remove s default mapping
keymap("n", "s", "", opts)
-- remap macro record key
keymap("n", "Q", "q", opts)
-- cancel q, to avoid accidentally click `q` to arouse @q
keymap("n", "q", "<Nop>", opts)

-- Don't yank on delete char
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)
keymap("v", "x", '"_x', opts)
keymap("v", "X", '"_X', opts)

-- Better window operation
-- navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- new and close
keymap("n", "sv", ":vsp<CR>", opts)
keymap("n", "sh", ":sp<CR>", opts)
keymap("n", "sc", "<C-w>c", opts)
keymap("n", "so", "<C-w>o", opts)        -- only the window, close others


-- browser the code, map the <C-u> <C-d>
-- faster than jk, slower than C-u(half the screen)
keymap("n", "<C-u>", "9k", opts)
keymap("n", "<C-d>", "9j", opts)


-- no highlight
keymap("n", "<leader>nh", ":nohl<cr>", opts)


-- simplify line navigation
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)



-- Insert mode --
-- Press jl fast to ESC
keymap("i", "jl", "<ESC>", opts)

-- no highlight
keymap("n", "<leader>nh", ":nohl<cr>", opts)


--  ╭──────────────────────────────────────────────────────────╮
--  │ plugin keymaps                                           │
--  ╰──────────────────────────────────────────────────────────╯

--lazy.nvim
keymap("n", "<leader>/l", "<cmd>:Lazy<cr>", opts)

-- nvim-tree
keymap("n", "<A-m>", ":NvimTreeToggle<CR>", opts)

-- barbar
-- Move to previous/next
keymap("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
keymap("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
keymap("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
keymap("n", "<A-0>", "<Cmd>BufferLast 0<CR>", opts)
-- Pin/unpin buffer
keymap("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
keymap("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Magic buffer-picking mode
keymap("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)

-- Comment box
keymap("n", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", opts)
keymap("v", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", opts)

-- Spectre
keymap('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
    desc = "Open Spectre"
})
keymap('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
keymap('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
keymap('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

-- LSP
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent) -- Replaced with Glance plugin
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent) -- Replaced with Glance plugin
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", opts)
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", opts)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", opts)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", opts)
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", opts)
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
-- glance
keymap("n", "gd", "<cmd>Glance definitions<CR>", opts)
keymap("n", "gr", "<cmd>Glance references<CR>", opts)
keymap("n", "gy", "<cmd>Glance type_definitions<CR>", opts)
keymap("n", "gm", "<cmd>Glance implementations<CR>", opts)

-- gitsigns
-- setup in plugins.git.signs


