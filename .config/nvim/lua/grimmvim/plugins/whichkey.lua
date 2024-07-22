return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			icons = {
				rules = false,
				separator = "➜",
				group = "",
			},
			show_keys = false,
			show_help = false, -- show a help message in the command line for using WhichKey
			layout = {
				align = "center",
			},
			win = {
				border = "double",
				title = false,
				padding = { 1, 1 }, -- extra window padding [top/bottom, right/left]
				no_overlap = true,
			},
			wk.add({
				{ "<leader>f", group = "Telescope" },
				{ "<leader>s", group = "Sessions" },
				{ "<leader>e", group = "File Tree" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>o", group = "Option Commands" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>F", group = "Format" },
				{ "<leader>p", group = "Pane" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>T", group = "Tagbar" },
				{ "<leader>g", group = "Gitsigns" },
			}),
		})
	end,
}
