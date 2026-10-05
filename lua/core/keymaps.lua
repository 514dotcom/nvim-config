-- Keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better navigation
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Window resize
map("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor centered when scrolling
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Better paste
map("x", "p", "\"_dP", opts)

-- Quick save
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<leader>q", "<cmd>q<CR>", opts)
map("n", "<leader>x", "<cmd>x<CR>", opts)

-- Escape terminal mode
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Clear search
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Quickfix
map("n", "<leader>cn", "<cmd>cnext<CR>", opts)
map("n", "<leader>cp", "<cmd>cprev<CR>", opts)

-- Better tab navigation
map("n", "<leader>tt", "<cmd>tabnew<CR>", opts)
map("n", "<leader>tn", "<cmd>tabn<CR>", opts)
map("n", "<leader>tp", "<cmd>tabp<CR>", opts)