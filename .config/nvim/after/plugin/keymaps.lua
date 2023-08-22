--[Vim Keymaps Config ]]
local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>pv", vim.cmd.Ex)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Resize with arrows
keymap("n", "<C-A-K>", ":resize -2<CR>", opts)
keymap("n", "<C-A-J>", ":resize +2<CR>", opts)
keymap("n", "<C-A-H>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-A-L>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Navigate QuickFix
keymap("n", "<C-n>", ":cn<CR>zz", opts)
keymap("n", "<C-A-N>", ":cp<CR>zz", opts)

-- Quick Replace
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)


-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Normal cmd
keymap("v", "n", [[:norm ]], opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- System Clipboard --
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+Y", opts)


-- Telescope --
vim.api.nvim_set_keymap("n", "<C-r>", ":Telescope lsp_document_symbols theme=dropdown previewer=false<cr>", {
	noremap = true,
	silent = true,
	desc = "Search [D]ocument [S]ymbols"
})
vim.api.nvim_set_keymap("n", "<C-p>",
	":Telescope find_files theme=dropdown hidden=true previewer=false<cr>", {
		noremap = true,
		silent = true,
		desc = "Search [D]ocument [S]ymbols"
	})
