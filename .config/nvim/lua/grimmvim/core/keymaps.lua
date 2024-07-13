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
map({ "i", "n", "v" }, "kj", "<Esc>", { noremap = true, silent = false })

-- Remapping gj gk for wrapped line
map("n", "j", "gj", { noremap = true, silent = true })
map("n", "k", "gk", { noremap = true, silent = true })

-- Unhighlight searched elements
map("n", "<C-m>", ":nohlsearch<cr>", { noremap = true, silent = true })

-- Editing Keymaps
map("n", "<leader>q", ":q<cr>", { desc = "QUIT FILE", noremap = true, silent = true })
map("n", "<leader>Q", ":q!<cr>", { desc = "FORCE QUIT FILE", noremap = true, silent = true })
map("n", "<leader>w", ":w<cr>", { desc = "Write File", noremap = true, silent = true })
map("n", "<leader>W", ":w!<cr>", { desc = "Force Write File", noremap = true, silent = true })
map("n", "<leader>M", ":messages<cr>", { desc = "Show Messages", noremap = true, silent = true })

-- Edit neovim configs
map("n", "<leader>Ec", ":e ~/.config/nvim/<cr>", { desc = "Edit Neovim Config", noremap = true, silent = true })

-- Nvim Options
map("n", "<leader>ow", ":set wrap<cr>", { desc = "Wrap Lines", noremap = true, silent = true })
map("n", "<leader>oW", ":set nowrap<cr>", { desc = "Unwrap Lines", noremap = true, silent = true })
map("n", "<leader>ol", ":set linebreak<cr>", { desc = "Break Lines", noremap = true, silent = true })
map("n", "<leader>oL", ":set nolinebreak<cr>", { desc = "Unbreak Lines", noremap = true, silent = true })
map("n", "<leader>os", ":set spell<cr>", { desc = "Spell Check On", noremap = true, silent = true })
map("n", "<leader>oS", ":set nospell<cr>", { desc = "Spell Check Off", noremap = true, silent = true })
-- Markdown
map(
	"n",
	"<leader>om",
	":MarkdownPreviewToggle<cr>",
	{ desc = "Toggle Markdown Preview", noremap = true, silent = true }
)

-- Buffers
map("n", "<leader>bn", ":bnext<cr>", { desc = "Next Buffer", noremap = true, silent = true })
map("n", "<leader>bp", ":bprevious<cr>", { desc = "Previous Buffer", noremap = true, silent = true })
map("n", "<leader>bl", ":blast<cr>", { desc = "Last Buffer", noremap = true, silent = true })
map("n", "<leader>bx", ":bdelete<cr>", { desc = "Last Buffer", noremap = true, silent = true })
map("n", "<leader>bs", ":source %<cr>", { desc = "Source Buffer", noremap = true, silent = true })

-- Split or Pane
map("n", "<leader>pv", ":vsplit<cr>", { desc = "Split Vertically", noremap = true, silent = true })
map("n", "<leader>ph", ":split<cr>", { desc = "Split horizontally", noremap = true, silent = true })
map("n", "<leader>pc", ":close<cr>", { desc = "Close Split", noremap = true, silent = true })
map("n", "<leader>po", ":only<cr>", { desc = "Fullscreen Split", noremap = true, silent = true })

-- =================================
--  Plugin Relate Keymaps
-- =================================

-- NvimTree and UndoTree
map("n", "<leader>ee", ":NvimTreeToggle<cr>", { desc = "NvimTree Toggle", noremap = true, silent = true })
map("n", "<leader>ef", ":NvimTreeFocus<cr>", { desc = "NvimTree Focus", noremap = true, silent = true })
map("n", "<leader>er", ":e .<cr>", { desc = "NvimTree Root Folder", noremap = true, silent = true })
map("n", "<leader>eh", ":e ~/<cr>", { desc = "NvimTree Home", noremap = true, silent = true })
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
map("n", "<leader>sr", ":Telescope resume<cr>", { desc = "Resume Search", noremap = true, silent = true })
map("n", "<leader>sb", ":Telescope buffers<cr>", { desc = "Fuzzy Find Buffers", noremap = true, silent = true })

-- ToggleTerm
map("n", "<leader>tt", ":ToggleTerm<cr>", { desc = "Terminal Below", noremap = true, silent = true })
map("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = "Terminal Floating", noremap = true, silent = true })
map("n", "<leader>tl", ":LazyGit<cr>", { desc = "LazyGit", noremap = true, silent = true })

-- Tagbar
map("n", "<leader>Tf", ":TagbarToggle<cr>", { desc = "Tagbar Toggle", noremap = true, silent = true })

-- LSP config
map("n", "<leader>li", ":LspInfo<cr>", { desc = "Connected Language Servers", noremap = true, silent = true })
map("n", "<leader>lk", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover Docs", noremap = true, silent = true })
map(
	"n",
	"<leader>lK",
	"<cmd>lua vim.lsp.buf.signature_help()<cr>",
	{ desc = "Signature Help", noremap = true, silent = true }
)
map(
	"n",
	"<leader>lw",
	"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
	{ desc = "Add Workspace Folder", noremap = true, silent = true }
)
map(
	"n",
	"<leader>lW",
	"<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
	{ desc = "Remove Workspace Folder", noremap = true, silent = true }
)
map(
	"n",
	"<leader>ll",
	"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
	{ desc = "List Workspace Folders", noremap = true, silent = true }
)
map(
	"n",
	"<leader>lt",
	"<cmd>lua vim.lsp.buf.type_definition()<cr>",
	{ desc = "Type Definition", noremap = true, silent = true }
)
map(
	"n",
	"<leader>ld",
	"<cmd>lua vim.lsp.buf.definition()<cr>",
	{ desc = "Go To Definition", noremap = true, silent = true }
)
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "References", noremap = true, silent = true })
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
map("n", "<leader>lF", ":lua vim.lsp.buf.format()<cr>", { desc = "Format code", noremap = true, silent = true })
