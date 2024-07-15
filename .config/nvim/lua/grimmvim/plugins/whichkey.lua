return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		icons = {
			rules = false,
			separator = "-",
		},
		layout = {
			align = "center",
		},
		win = {
			border = "double",
		},
		plugins = {
			spelling = {
				enabled = false,
				suggestions = 0,
			},
			marks = false,
			registers = false,
		},
		modes = {
			i = false,
			x = false,
			s = false,
			o = false,
			t = false,
			c = false,
		},
		preset = "classic",
	},
}
