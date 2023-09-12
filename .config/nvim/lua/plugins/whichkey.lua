-- requring plugin
local installed, WhichKey = pcall(require, "which-key")
if not installed then
	vim.notify("Plugin 'which-key' is not installed")
	return
end

-- requring plugin
local installed, ToggleTerm = pcall(require, "toggleterm.terminal")
if not installed then
	vim.notify("Plugin 'toggleterm' is not installed")
	return
end

-- ##################################################################################################

local wk = WhichKey

local Terminal = ToggleTerm.Terminal
local toggle_float = function()
	local float = Terminal:new({ direction = "float" })
	return float:toggle()
end

local toggle_lazygit = function()
	local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
	return lazygit:toggle()
end

-- ##################################################################################################
-- Keymaps
local mappings = {
	-- Basic Operations
	q = { ":q<cr>", "Quit File" },
	Q = { ":q!<cr>", "Force Quit File" },
	w = { ":w<cr>", "Save File" },
	W = { ":w!<cr>", "Force Save File" },

	-- Buffers
	b = {
		name = "buffers",

		x = { ":bdelete<cr>", "Close Buffer" },
		n = { ":bnext<cr>", "Next Buffer" },
		l = { ":blast<cr>", "Last Buffer" },
	},

	Ec = { ":e ~/.config/nvim<cr>", "Edit Configs" },

	-- NvimTree
	e = {
		name = "NvimTree",
		e = { ":NvimTreeToggle<cr>", "NvimTreeToggle" },
		f = { ":NvimTreeFocus<cr>", "NvimTreeFocus" },
		h = { ":e ~/<cr>", "NvimTreeHome" },
	},
	-- Telescope
	s = {
		name = "Telescope",
		f = { ":Telescope find_files theme=ivy<cr>", "Telescope find_files" },
		w = { ":Telescope current_buffer_fuzzy_find theme=ivy<cr>", "Fuzzy Find in File" },
		o = { ":Telescope oldfiles theme=ivy<cr>", "Telescope oldfiles" },
		g = { ":Telescope live_grep theme=ivy<cr>", "Telescope live_grep" },
		r = { ":Telescope resume theme=ivy<cr>", "Telescope resume" },
		b = { ":Telescope buffers theme=ivy<cr>", "Telescope buffers" },
	},
	-- Split
	p = {
		name = "Split",
		v = { ":vsplit<cr>", "Split Vertically" },
		h = { ":split<cr>", "Split Vertically" },
	},
	-- Terminal
	t = {
		t = { ":ToggleTerm<cr>", "Split Below" },
		f = { toggle_float, "Floating Terminal" },
		l = { toggle_lazygit, "LazyGit" },
	},

	-- Lsp Stuffs
	l = {
		name = "LSP",
		i = { ":LspInfo<cr>", "Connected Language Servers" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
		w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
		W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
		l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folders" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		R = { "<cmd>Lspsaga rename<cr>", "Rename" },
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
		n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
		N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
	},

	-- Tagbar for function list
	T = {
		f = { ":TagbarToggle<cr>", "Functions List Tagbar" },
	},

	-- Code Formatting
	F = {
		name = "Code Formoat",
		M = { ":lua vim.lsp.buf.format()<cr>", "Format code" },
	},

	-- debugging nvim dap
	D = {
		name = "DAP",
		b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		c = { "<cmd>lua require('dap').continue()<cr>", "DAP Continue" },
		si = { "<cmd>lua require('dap').step_into()<cr>", "DAP Step into" },
		so = { "<cmd>lua require('dap').step_out()<cr>", "DAP Step Out" },
	},
}
local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
