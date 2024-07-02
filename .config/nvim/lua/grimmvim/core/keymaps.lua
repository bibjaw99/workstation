vim.g.mapleader = " "
local map = vim.keymap.set
-- Toggle between tabs
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- Buffer
map("n", "<Tab>", ":bnext<cr>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<cr>", { noremap = true, silent = true })

-- Indenting
map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", ">gv", { noremap = true, silent = false })

-- Copy-Pasting
map("v", "<C-c>", '"+y', { noremap = true, silent = false })
map("n", "<C-s>", '"+P', { noremap = true, silent = false })

-- Remapping Escape key
map({"i","n","v"}, "kj", "<Esc>", { noremap = true, silent = false })

-- Remapping gj gk for wrapped line
map("n", "j", "gj", { noremap = true, silent = true })
map("n", "k", "gk", { noremap = true, silent = true })

-- Unhighlight searched elements
map("n", "<C-m>", ":nohlsearch<cr>", { noremap = true, silent = true })
