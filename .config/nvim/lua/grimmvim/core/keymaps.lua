vim.g.mapleader = " "
local map = vim.keymap.set

-- Remapping gj gk for wrapped line
map("n", "j", "gj", { noremap = true, silent = true })
map("n", "k", "gk", { noremap = true, silent = true })

-- remapping escape key
map({ "i", "n", "v" }, "kj", "<Esc>", { desc = "Escape", noremap = true, silent = false })

-- disable search highlight
map("n", "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "Disable Search Highlight", noremap = true, silent = false })

-- Indenting
map("v", "<", "<gv", { desc = "Indent >", noremap = true, silent = false })
map("v", ">", ">gv", { desc = "Indent <", noremap = true, silent = false })

-- Copy-Pasting
map("v", "<C-c>", '"+y', { desc = "Copy To ClipB", noremap = true, silent = false })
map("n", "<C-s>", '"+P', { desc = "Paste From ClipB", noremap = true, silent = false })

-- Focus between windows
map("n", "<C-h>", "<C-w>h", { desc = "Focus Left", noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { desc = "Focus Right", noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { desc = "Focus Up", noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { desc = "Focus Down", noremap = true, silent = false })

-- Editing Keymaps
map("n", "<leader>q", ":q<cr>", { desc = "QUIT FILE", noremap = true, silent = true })
map("n", "<leader>Q", ":q!<cr>", { desc = "FORCE QUIT FILE", noremap = true, silent = true })
map("n", "<leader>w", ":w<cr>", { desc = "Write File", noremap = true, silent = true })
map("n", "<leader>W", ":w!<cr>", { desc = "Force Write File", noremap = true, silent = true })
map("n", "<leader>M", ":messages<cr>", { desc = "Show Messages", noremap = true, silent = true })

-- Nvim Options
map("n", "<leader>ow", ":set wrap<cr>", { desc = "Wrap Lines", noremap = true, silent = true })
map("n", "<leader>oW", ":set nowrap<cr>", { desc = "Unwrap Lines", noremap = true, silent = true })
map("n", "<leader>ol", ":set linebreak<cr>", { desc = "Break Lines", noremap = true, silent = true })
map("n", "<leader>oL", ":set nolinebreak<cr>", { desc = "Unbreak Lines", noremap = true, silent = true })
map("n", "<leader>os", ":set spell<cr>", { desc = "Spell Check On", noremap = true, silent = true })
map("n", "<leader>oS", ":set nospell<cr>", { desc = "Spell Check Off", noremap = true, silent = true })

-- Buffers
map("n", "<Tab>", ":bnext<cr>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<cr>", { noremap = true, silent = true })
map("n", "<leader>bn", ":bnext<cr>", { desc = "Next Buffer", noremap = true, silent = true })
map("n", "<leader>bp", ":bprevious<cr>", { desc = "Previous Buffer", noremap = true, silent = true })
map("n", "<leader>bl", ":blast<cr>", { desc = "Last Buffer", noremap = true, silent = true })
map("n", "<leader>bx", ":bdelete<cr>", { desc = "Last Buffer", noremap = true, silent = true })
map("n", "<leader>bs", ":source %<cr>", { desc = "Source Buffer", noremap = true, silent = true })

-- Splits and Panes
map("n", "<leader>pv", "<C-w>v", { desc = "Split Vertically", noremap = true, silent = false })
map("n", "<leader>ph", "<C-w>s", { desc = "Split Horizontally", noremap = true, silent = false })
map("n", "<leader>pe", "<C-w>=", { desc = "Equal Split", noremap = true, silent = false })
map("n", "<leader>px", "<cmd>close<CR>", { desc = "Close split", noremap = true, silent = false })
map("n", "<leader>po", "<cmd>only<CR>", { desc = "Single Pane", noremap = true, silent = false })
