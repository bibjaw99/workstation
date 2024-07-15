vim.g.mapleader = " "
local map = vim.keymap.set

-- Remapping gj gk for wrapped line
map("n", "j", "gj", { noremap = true, silent = true })
map("n", "k", "gk", { noremap = true, silent = true })

-- remapping escape key
map({ "i", "n", "v" }, "kj", "<Esc>", { desc = "Escape", noremap = true, silent = true })

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

-- =========================
-- plugin specific keymaps
-- =========================

-- Tagbar
map("n", "<leader>Tf", ":TagbarToggle<cr>", { desc = "Tagbar Toggle", noremap = true, silent = true })

-- Toggle Term
map("n", "<leader>tt", ":ToggleTerm<cr>", { desc = "Terminal Below", noremap = true, silent = true })
map("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = "Terminal Floating", noremap = true, silent = true })

-- Markdown Preview
map(
	"n",
	"<leader>om",
	":MarkdownPreviewToggle<cr>",
	{ desc = "Toggle Markdown Preview", noremap = true, silent = true }
)

-- NvimTree
map("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTree Toggle", noremap = true, silent = true })
map("n", "<leader>ef", "<cmd>NvimTreeFocus<cr>", { desc = "NvimTree Current", noremap = true, silent = true })
map("n", "<leader>eF", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "NvimTree Current", noremap = true, silent = true })
map("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>", { desc = "NvimTree Refresh", noremap = true, silent = true })
map(
	"n",
	"<leader>el",
	"<cmd>NvimTreeCollapse<cr>",
	{ desc = "NvimTree Collapse Folder", noremap = true, silent = true }
)
map(
	"n",
	"<leader>ec",
	"<cmd>e ~/.config/nvim/lua/grimmvim/<cr>",
	{ desc = "Nvim Config Dir", noremap = true, silent = true }
)
-- UndoTree
map("n", "<leader>eu", ":UndotreeToggle<cr>", { desc = "UndoTree Toggle", noremap = true, silent = true })

-- Telescope
map("n", "<leader>sf", ":Telescope find_files<cr>", { desc = "Fuzzy Find", noremap = true, silent = true })
map(
	"n",
	"<leader>sw",
	":Telescope current_buffer_fuzzy_find<cr>",
	{ desc = "Fuzzy Find Pattern", noremap = true, silent = true }
)
map("n", "<leader>so", ":Telescope oldfiles<cr>", { desc = "Fuzzy Find Recent Files", noremap = true, silent = true })
map("n", "<leader>sg", ":Telescope live_grep<cr>", { desc = "Live Grep", noremap = true, silent = true })
map("n", "<leader>sc", ":Telescope grep_string<cr>", { desc = "String", noremap = true, silent = true })
map("n", "<leader>sr", ":Telescope resume<cr>", { desc = "Resume Search", noremap = true, silent = true })
map("n", "<leader>sk", ":Telescope keymaps<cr>", { desc = "Search Keymaps", noremap = true, silent = true })
map("n", "<leader>sb", ":Telescope buffers<cr>", { desc = "Fuzzy Find Buffers", noremap = true, silent = true })

-- LSP Keymaps
map("n", "<leader>li", ":LspInfo<cr>", { desc = "Connected Language Servers", noremap = true, silent = true })
map(
	"n",
	"<leader>lK",
	"<cmd>lua vim.lsp.buf.signature_help()<cr>",
	{ desc = "Signature Help", noremap = true, silent = true }
)
map(
	"n",
	"<leader>lD",
	"<cmd>Telescope diagnostics<cr>",
	{ desc = "Telescope Diagnostic", noremap = true, silent = true }
)
map(
	"n",
	"<leader>lt",
	"<cmd>Telescope lsp_type_definitions<cr>",
	{ desc = "Type Definition", noremap = true, silent = true }
)
map(
	"n",
	"<leader>ld",
	"<cmd>Telescope lsp_definitions<cr>",
	{ desc = "Go To Definition", noremap = true, silent = true }
)
map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", { desc = "References", noremap = true, silent = true })

-- LSP_Saga
map("n", "<leader>lk", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover Docs", noremap = true, silent = true })
map("n", "<leader>lR", "<cmd>Lspsaga rename<cr>", { desc = "Rename", noremap = true, silent = true })
map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Code Action", noremap = true, silent = true })
map(
	"n",
	"<leader>le",
	"<cmd>Lspsaga show_line_diagnostics<cr>",
	{ desc = "Show Line Diagnostics", noremap = true, silent = true }
)
map(
	"n",
	"<leader>ln",
	"<cmd>Lspsaga diagnostic_jump_next<cr>",
	{ desc = "Go To Next Diagnostic", noremap = true, silent = true }
)
map(
	"n",
	"<leader>lN",
	"<cmd>Lspsaga diagnostic_jump_prev<cr>",
	{ desc = "Go To Previous Diagnostic", noremap = true, silent = true }
)
map("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "LSP Saga outline", noremap = true, silent = true })
