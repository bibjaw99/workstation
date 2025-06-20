return {
	"folke/which-key.nvim",
	event = "CursorMoved",
	config = function()
		local wk = require("which-key")
		-- disable missing-fields warning using lua annotations
		---@diagnostic disable-next-line: missing-fields
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
				border = "bold",
				title = false,
				padding = { 1, 1 }, -- extra window padding [top/bottom, right/left]
				no_overlap = true,
			},
			wk.add({
				{ "<leader>f", group = "Telescope" },
				{ "<leader>s", group = "Sessions" },
				{ "<leader>e", group = "File Tree" },
				{ "<leader>u", group = "Undotree" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>o", group = "Options Commands" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>p", group = "Pane" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>g", group = "Gitsigns" },
				{ "<leader>c", group = "Snacks" },
				{ "<leader>n", group = "Noice" },
			}),
		})
	end,
}
