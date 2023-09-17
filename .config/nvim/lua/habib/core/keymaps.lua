vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
-- Toggle between tabs
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- BufferLine
map("n", "<A-n>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
map("n", "<A-p>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })

-- Indenting
map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", ">gv", { noremap = true, silent = false })

-- Copy-Pasting
map("v", "<C-c>", '"+y', { noremap = true, silent = false })
map("n", "<C-s>", '"+P', { noremap = true, silent = false })

-- Remapping Escape key
map("i", "kj", "<Esc>", { noremap = true, silent = false })
map("n", "kj", "<Esc>", { noremap = true, silent = false })
map("v", "kj", "<Esc>", { noremap = true, silent = false })

-- Unhighlight searched elements
map("n", "<C-u>", ":nohlsearch<cr>", { noremap = true, silent = true })
