vim.g.mapleader = " "
local map = vim.keymap.set

-- custom functions
vim.keymap.set(
	"n",
	"gf",
	":lua OpenFile()<cr>",
	{ desc = "Open or create file under cursor", noremap = true, silent = true }
)

-- disable double click mouse
vim.api.nvim_set_keymap("n", "<2-LeftMouse>", "", { noremap = true, silent = true })

-- source buffer
map("n", "<leader><leader>S", ":source %<cr>", { desc = "Source Buffer", noremap = true, silent = true })

-- Remapping gj gk for wrapped line
map("n", "j", "gj", { desc = "Down In Wrap", noremap = true, silent = true })
map("n", "k", "gk", { desc = "Up In Wrap", noremap = true, silent = true })

-- Remapping JK
map("n", "J", "<C-d>", { desc = "Scroll Down", noremap = true, silent = false })
map("n", "K", "<C-u>", { desc = "Scroll Up", noremap = true, silent = false })

-- Move around in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Down In Visual", noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Up In Visual", noremap = true, silent = true })

-- remapping escape key
map({ "i", "v" }, "kj", "<Esc>", { desc = "Escape", noremap = true, silent = true })
map("t", "<Esc><Esc>", "<C-\\><C-N>", { desc = "Escape Term Mode", noremap = true, silent = true })

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

-- Resize windows or panes
map("n", "<C-S-H>", "3<C-w>>", { desc = "Resize Left", noremap = true, silent = false })
map("n", "<C-S-J>", "3<C-w>-", { desc = "Resize Right", noremap = true, silent = false })
map("n", "<C-S-K>", "3<C-w>+", { desc = "Resize Up", noremap = true, silent = false })
map("n", "<C-S-L>", "3<C-w><", { desc = "Resize Down", noremap = true, silent = false })

-- Editing Keymaps
map("n", "<leader>q", ":q<cr>", { desc = "Quit File", noremap = true, silent = true })
map("n", "<leader>Q", ":qa<cr>", { desc = "Quit All Files", noremap = true, silent = true })
map("n", "<leader>w", ":w<cr>", { desc = "Write File", noremap = true, silent = true })
map("n", "<leader>W", ":wa<cr>", { desc = "Write All Files", noremap = true, silent = true })
map("n", "<leader>M", ":messages<cr>", { desc = "Show Messages", noremap = true, silent = true })

-- Navigate between quickfix items
map("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = "QuickFixList Next" })
map("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = "QuickFixList Previous" })

-- Nvim Options and Commands
map("n", "<leader>ow", ":set wrap!<cr>", { desc = "Toggle Wrap Lines", noremap = true, silent = true })
map("n", "<leader>ol", ":set linebreak!<cr>", { desc = "Toggle Break Lines", noremap = true, silent = true })
map("n", "<leader>os", ":set spell!<cr>", { desc = "Toggle Spell Check On", noremap = true, silent = true })
map("n", "<leader>oh", ":set hlsearch!<cr>", { desc = "Toggle Search Highlight", noremap = true, silent = false })
map("n", "<leader>od", ":pwd<cr>", { desc = "Current Working Directory", noremap = true, silent = false })
map(
	"n",
	"<leader>oc",
	":lua ToggleConcealLevel()<cr>",
	{ desc = "Toggle Conceallevel", noremap = true, silent = false }
)

-- Buffers
map("n", "<Tab>", ":bnext<cr>", { desc = "Next Buffer", noremap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<cr>", { desc = "Previous Buffer", noremap = true, silent = true })
map("n", "<leader>bn", ":enew<cr>", { desc = "New Empty Buffer", noremap = true, silent = true })
map("n", "<leader>bl", ":blast<cr>", { desc = "Last Buffer", noremap = true, silent = true })
-- map("n", "<leader>bx", ":bp<bar>sp<bar>bn<bar>bd<cr>", { desc = "Delete Buffer", noremap = true, silent = true })
map("n", "<leader>bs", ":source %<cr>", { desc = "Source Buffer", noremap = true, silent = true })

-- Splits and Panes
map("n", "<leader>pv", "<C-w>v", { desc = "Split Vertically", noremap = true, silent = false })
map("n", "<leader>ph", "<C-w>s", { desc = "Split Horizontally", noremap = true, silent = false })
map("n", "<leader>pe", "<C-w>=", { desc = "Equal Split", noremap = true, silent = false })
map("n", "<leader>px", ":close<CR>", { desc = "Close split", noremap = true, silent = false })
map("n", "<leader>po", ":only<CR>", { desc = "Single Pane", noremap = true, silent = false })

-- Toggle Term
map("n", "<C-q>", ":Lspsaga term_toggle<cr>", { desc = "Floating Terminal", noremap = true, silent = true })
map("n", "<leader>t", ":sp<bar>term<cr>:resize 10<cr>", { desc = "Split Terminal", noremap = true, silent = true })

-- add ; at the end of the line
map("i", "<C-;>", "<esc>A;<esc>i", { desc = "semicolon at the end", noremap = true, silent = true })
