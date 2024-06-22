return {

	"folke/which-key.nvim",
	dependencies = {
		"akinsho/toggleterm.nvim",
	},

	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		local wk = require("which-key")
		-- border
		wk.setup({
			window = {
				border = "double",
			},
		})

		local terminal = require("toggleterm.terminal").Terminal

		local toggle_float = function()
			local float = terminal:new({ direction = "float" })
			return float:toggle()
		end

		local toggle_lazygit = function()
			local lazygit = terminal:new({ cmd = "lazygit", direction = "float" })
			return lazygit:toggle()
		end

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
				s = { ":source %<cr>", "Source Buffer" },
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
				f = { ":Telescope find_files<cr>", "Telescope find_files" },
				w = { ":Telescope current_buffer_fuzzy_find<cr>", "Fuzzy Find in File" },
				o = { ":Telescope oldfiles<cr>", "Telescope oldfiles" },
				g = { ":Telescope live_grep<cr>", "Telescope live_grep" },
				r = { ":Telescope resume<cr>", "Telescope resume" },
				b = { ":Telescope buffers<cr>", "Telescope buffers" },
			},
			-- Split
			p = {
				name = "Split",
				v = { ":vsplit<cr>", "Split Vertically" },
				h = { ":split<cr>", "Split Vertically" },
				c = { ":close<cr>", "Close Pane" },
				o = { ":only<cr>", "Single Pane" },
			},
			-- Terminal
			t = {
				t = { ":ToggleTerm<cr>", "Split Below" },
				f = { toggle_float, "Floating Terminal" },
				l = { toggle_lazygit, "LazyGit" },
			},

			-- Set Options shortcutts
			o = {
				name = "Vim Options",
				w = { ":set wrap<cr>", "Wrap Lines" },
				W = { ":set nowrap<cr>", "Unwrap Lines" },
				l = { ":set linebreak<cr>", "Linebreak On" },
				L = { ":set nolinebreak<cr>", "Linebreak Off" },
				s = { ":set spell<cr>", "Spell Check On" },
				S = { ":set nospell<cr>", "Spell Check Off" },
				m = { ":MarkdownPreviewToggle<cr>", "Toggle Markdown Preview" },
			},
			-- Lsp Stuffs
			l = {
				name = "LSP",
				i = { ":LspInfo<cr>", "Connected Language Servers" },
				k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
				K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
				w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
				W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
				l = {
					"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
					"List Workspace Folders",
				},
				t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
				d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
				D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
				r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
				R = { "<cmd>Lspsaga rename<cr>", "Rename" },
				a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
				e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
				n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
				N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
				F = { ":lua vim.lsp.buf.format()<cr>", "Format code" },
			},

			-- Tagbar for function list
			T = {
				f = { ":TagbarToggle<cr>", "Functions List Tagbar" },
			},
		}

		local opts = { prefix = "<leader>" }
		wk.register(mappings, opts)
	end,
}
