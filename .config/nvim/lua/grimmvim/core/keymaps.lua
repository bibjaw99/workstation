vim.g.mapleader = " "
local map = vim.keymap.set

-- custom functions
vim.keymap.set(
	"n",
	"gf",
	":lua OpenFile()<cr>",
	{ desc = "Open or create file under cursor", noremap = true, silent = true }
)

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
map("n", "<leader>q", ":q<cr>", { desc = "QUIT FILE", noremap = true, silent = true })
map("n", "<leader>Q", ":qa<cr>", { desc = "FORCE QUIT FILE", noremap = true, silent = true })
map("n", "<leader>w", ":w<cr>", { desc = "Write File", noremap = true, silent = true })
map("n", "<leader>W", ":wa<cr>", { desc = "Force Write File", noremap = true, silent = true })
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
map("n", "<leader>bx", ":bp<bar>sp<bar>bn<bar>bd<cr>", { desc = "Delete Buffer", noremap = true, silent = true })
map("n", "<leader>bs", ":source %<cr>", { desc = "Source Buffer", noremap = true, silent = true })

-- Splits and Panes
map("n", "<leader>pv", "<C-w>v", { desc = "Split Vertically", noremap = true, silent = false })
map("n", "<leader>ph", "<C-w>s", { desc = "Split Horizontally", noremap = true, silent = false })
map("n", "<leader>pe", "<C-w>=", { desc = "Equal Split", noremap = true, silent = false })
map("n", "<leader>px", ":close<CR>", { desc = "Close split", noremap = true, silent = false })
map("n", "<leader>po", ":only<CR>", { desc = "Single Pane", noremap = true, silent = false })

-- =========================
-- plugin specific keymaps
-- =========================

-- Tagbar
map("n", "<leader>Tf", ":TagbarToggle<cr>", { desc = "Tagbar Toggle", noremap = true, silent = true })

-- Toggle Term
map("n", "<C-q>", ":Floaterminal<cr>", { desc = "Floating Terminal", noremap = true, silent = true })
map("n", "<leader>t", ":sp<bar>term<cr>:resize 10<cr>", { desc = "Split Terminal", noremap = true, silent = true })

-- Markdown Preview
map(
	"n",
	"<leader>om",
	":MarkdownPreviewToggle<cr>",
	{ desc = "Toggle Markdown Preview", noremap = true, silent = true }
)

-- Auto-Session Manager
map("n", "<leader>ss", ":SessionSave<CR>", { desc = "Sessions Save", noremap = true, silent = true })
map("n", "<leader>sl", ":Autosession search<cr>", { desc = "Available Sessions", noremap = true, silent = true })
map("n", "<leader>sd", ":Autosession delete<cr>", { desc = "Delete Sessions", noremap = true, silent = true })
map("n", "<leader>sr", ":SessionRestore ", { desc = "Restore Sessions", noremap = true, silent = true })
map(
	"n",
	"<leader>sa",
	":SessionToggleAutoSave<CR>",
	{ desc = "Toggle Autosave Sessions", noremap = true, silent = true }
)
map(
	"n",
	"<leader>sD",
	":SessionDisableAutoSave<CR>",
	{ desc = "Disable Autosave Sessions", noremap = true, silent = true }
)
map("n", "<leader>sp", ":SessionPurgeOrphaned<CR>", { desc = "Purge Orphaned Sessions", noremap = true, silent = true })

-- FileTree
map("n", "<leader>ec", ":e ~/.config/nvim/lua/grimmvim/<cr>", { desc = "Config Dir", noremap = true, silent = true })
map(
	"n",
	"<leader>et",
	":e ~/.local/share/nvim/mini.files/trash/<cr>",
	{ desc = "MiniFiles Trash", noremap = true, silent = true }
)
map(
	"n",
	"<leader>eo",
	":lua MiniFiles.open(vim.api.nvim_buf_get_name(0),true)<cr>",
	{ desc = "MiniFiles Current", noremap = true, silent = false }
)
map("n", "<leader>ee", ":lua MiniFiles.open()<cr>", { desc = "MiniFiles Open", noremap = true, silent = false })
map("n", "<leader>er", ":lua MiniFiles.reset()<cr>", { desc = "MiniFiles Reset", noremap = true, silent = false })

-- UndoTree
map("n", "<leader>uu", ":UndotreeToggle<cr>", { desc = "UndoTree Toggle", noremap = true, silent = true })
map("n", "<leader>uf", ":UndotreeFocus<cr>", { desc = "UndoTree Focus", noremap = true, silent = true })

-- Gitsigns
map("n", "<leader>gg", ":Gitsigns<cr>", { desc = "Gitsigns Options", noremap = true, silent = true })
map(
	"n",
	"<leader>gl",
	":Gitsigns toggle_linehl<cr>",
	{ desc = "Gitsigns Line Highlight", noremap = true, silent = true }
)
map(
	"n",
	"<leader>gw",
	":Gitsigns toggle_word_diff<cr>",
	{ desc = "Gitsigns Word Difference", noremap = true, silent = true }
)
map(
	"n",
	"<leader>gd",
	":Gitsigns toggle_deleted<cr>",
	{ desc = "Gitsigns Toggle Deleted", noremap = true, silent = true }
)
map("n", "<leader>gh", ":Gitsigns preview_hunk<cr>", { desc = "Gitsigns Preview Hunk", noremap = true, silent = true })
map("n", "<leader>gp", ":Gitsigns prev_hunk<cr>", { desc = "Gitsigns Previous Hunk", noremap = true, silent = true })
map("n", "<leader>gn", ":Gitsigns next_hunk<cr>", { desc = "Gitsigns Next Hunk", noremap = true, silent = true })
map("n", "<leader>gr", ":Gitsigns refresh<cr>", { desc = "Gitsigns Refresh", noremap = true, silent = true })
map("n", "<leader>gH", ":Gitsigns diffthis<cr>", { desc = "Gitsigns Compare History", noremap = true, silent = true })

-- FzfLua
map("n", "<leader>ff", ":FzfLua files<cr>", { desc = "Fuzzy Find", noremap = true, silent = true })
map("n", "<leader>fo", ":FzfLua oldfiles<cr>", { desc = "Fuzzy History", noremap = true, silent = true })
map("n", "<leader>fg", ":FzfLua grep<cr>", { desc = "Live Grep", noremap = true, silent = true })
map("n", "<leader>fc", ":FzfLua grep_cword<cr>", { desc = "Find Under Cursor", noremap = true, silent = true })
map("n", "<leader>fr", ":FzfLua resume<cr>", { desc = "Resume Search", noremap = true, silent = true })
map("n", "<leader>fw", ":FzfLua grep_curbuf<cr>", { desc = "Find in Buffer", noremap = true, silent = true })
map("n", "<leader>fk", ":FzfLua keymaps<cr>", { desc = "Search Keymaps", noremap = true, silent = true })
map("n", "<leader>fb", ":FzfLua buffers<cr>", { desc = "Fuzzy Find Buffers", noremap = true, silent = true })

-- LSP Keymaps
map("n", "<leader>li", ":LspInfo<cr>", { desc = "Connected Language Servers", noremap = true, silent = true })
map(
	"n",
	"<leader>ls",
	":lua vim.lsp.buf.signature_help()<CR>",
	{ desc = "Signaturehelp", noremap = true, silent = true }
)
map("n", "<leader>lr", ":FzfLua lsp_references<cr>", { desc = "References", noremap = true, silent = true })
-- LSP_Saga
map("n", "<leader>lk", ":Lspsaga hover_doc<cr>", { desc = "Hover Docs", noremap = true, silent = true })
map("n", "<leader>lf", ":Lspsaga finder<cr>", { desc = "LSP Finder", noremap = true, silent = true })
map("n", "<leader>ld", ":Lspsaga goto_definition<cr>", { desc = "Go To Definition", noremap = true, silent = true })
map("n", "<leader>lp", ":Lspsaga peek_definition<cr>", { desc = "Peek Definition", noremap = true, silent = true })
map("n", "<leader>lt", ":Lspsaga goto_type_definition<cr>", { desc = "Type Definition", noremap = true, silent = true })
map("n", "<leader>lR", ":Lspsaga rename<cr>", { desc = "Rename", noremap = true, silent = true })
map("n", "<leader>la", ":Lspsaga code_action<cr>", { desc = "Code Action", noremap = true, silent = true })
map(
	"n",
	"<leader>lD",
	":Lspsaga show_buf_diagnostics<cr>",
	{ desc = "Buffer Diagnostic", noremap = true, silent = true }
)
map(
	"n",
	"<leader>lc",
	":Lspsaga show_cursor_diagnostics<cr>",
	{ desc = "Cursor Diagnostic", noremap = true, silent = true }
)
map(
	"n",
	"<leader>lw",
	":Lspsaga show_workspace_diagnostics<cr>",
	{ desc = "Workspace Diagnostic", noremap = true, silent = true }
)
map(
	"n",
	"<leader>le",
	":Lspsaga show_line_diagnostics<cr>",
	{ desc = "Line Diagnostics", noremap = true, silent = true }
)
map(
	"n",
	"<leader>ln",
	":Lspsaga diagnostic_jump_next<cr>",
	{ desc = "Go To Next Diagnostic", noremap = true, silent = true }
)
map(
	"n",
	"<leader>lN",
	":Lspsaga diagnostic_jump_prev<cr>",
	{ desc = "Go To Previous Diagnostic", noremap = true, silent = true }
)
map("n", "<leader>lo", ":Lspsaga outline<cr>", { desc = "LSP Outline", noremap = true, silent = true })

-- Snacks Nvim
map(
	"n",
	"<leader>cn",
	':lua require("snacks").notifier.show_history()<cr>',
	{ desc = "Notifications", noremap = true, silent = true }
)
map("n", "<leader>cd", ':lua require("snacks").dim()<cr>', { desc = "Dim", noremap = true, silent = true })
map(
	"n",
	"<leader>cD",
	':lua require("snacks").dim.disable()<cr>',
	{ desc = "Dim Disable", noremap = true, silent = true }
)
map("n", "<leader>cz", ':lua require("snacks").zen()<cr>', { desc = "Zen Mode", noremap = true, silent = true })
map("n", "<leader>cg", ':lua require("snacks").lazygit()<cr>', { desc = "LazyGit", noremap = true, silent = true })

-- noice
map("n", "<leader>nh", ":Noice history<cr>", { desc = "History", noremap = true, silent = true })
map("n", "<leader>nl", ":Noice last<cr>", { desc = "Last Msg", noremap = true, silent = true })
map("n", "<leader>na", ":Noice all<cr>", { desc = "All Msg", noremap = true, silent = true })
map("n", "<leader>nd", ":Noice dismiss<cr>", { desc = "Dismiss", noremap = true, silent = true })
map("n", "<leader>np", ":Noice pick<cr>", { desc = "Pick", noremap = true, silent = true })
