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
				{ "<leader>s", group = "Telescope" },
				{ "<leader>e", group = "File Tree" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>o", group = "Options" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>f", group = "Format" },
				{ "<leader>p", group = "Pane" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>n", group = "NoHl" },
			}),
		})
	end,
}
