return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			icons = {
				rules = false,
				separator = "-",
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
		})
	end,
}
