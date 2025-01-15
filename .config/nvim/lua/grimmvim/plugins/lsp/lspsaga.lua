return {
	"glepnir/lspsaga.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		local map = vim.keymap.set
		local lspsaga = require("lspsaga")
		lspsaga.setup({
			lightbulb = {
				enable = false,
			},
			debug = false,
			use_saga_diagnostic_sign = true,
			-- diagnostic sign
			error_sign = "",
			warn_sign = "",
			hint_sign = "",
			infor_sign = "",
			diagnostic_header_icon = "   ",
			-- code action title icon
			code_action_icon = " ",
			code_action_prompt = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
			finder_definition_icon = "  ",
			finder_reference_icon = "  ",
			max_preview_lines = 10,

			finder_action_keys = {
				open = "o",
				vsplit = "s",
				split = "i",
				quit = "q",
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},

			hover = {
				max_width = 0.5,
			},

			code_action_keys = { quit = "q", exec = "<CR>" },
			rename_action_keys = { quit = "<C-c>", exec = "<CR>" },
			definition_preview_icon = "  ",
			border_style = "single",
			rename_prompt_prefix = "➤",
			server_filetype_map = {},
			diagnostic_prefix_format = "%d. ",
		})
		-- keymaps
		map("n", "<leader>lk", ":Lspsaga hover_doc<cr>", { desc = "Hover Docs", noremap = true, silent = true })
		map("n", "<leader>lf", ":Lspsaga finder<cr>", { desc = "LSP Finder", noremap = true, silent = true })
		map(
			"n",
			"<leader>ld",
			":Lspsaga goto_definition<cr>",
			{ desc = "Go To Definition", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>lp",
			":Lspsaga peek_definition<cr>",
			{ desc = "Peek Definition", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>lt",
			":Lspsaga goto_type_definition<cr>",
			{ desc = "Type Definition", noremap = true, silent = true }
		)
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
	end,
}
