return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local lspui = require("lspconfig.ui.windows")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		--LspInfo Borders
		lspui.default_options.border = "double"

		-- Managing language servers individually
		-- pyright
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		-- tsserver
		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})

		-- rust_analyzer
		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			-- Server-specific settings. See `:help lspconfig-setup`
			settings = {
				["rust-analyzer"] = {},
			},
		})

		-- clangd
		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		-- html
		lspconfig.html.setup({
			capabilities = capabilities,
		})

		-- configure emmet language server
		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- Lua LS
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- CSS LS
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		-- Tailwind
		-- Support for tailwind auto completion
		-- install the tailwind server : "sudo npm install -g @tailwindcss/language-server"
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		-- keymaps
		local map = vim.keymap.set
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
			"<cmd>lua vim.lsp.buf.type_definition()<cr>",
			{ desc = "Type Definition", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>ld",
			"<cmd>lua vim.lsp.buf.definition()<cr>",
			{ desc = "Go To Definition", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>lr",
			"<cmd>Telescope lsp_references<cr>",
			{ desc = "References", noremap = true, silent = true }
		)

		-- keymaps for LSP_Saga
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
	end,
}
