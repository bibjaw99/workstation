return {
	"echasnovski/mini.files",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("mini.files").setup({
			options = {
				permanent_delete = false,
				use_as_default_explorer = true,
			},
			mappings = {
				close = "q",
				go_in = "L",
				go_in_plus = "l",
				go_out = "H",
				go_out_plus = "h",
				mark_goto = "'",
				mark_set = "m",
				reset = "<BS>",
				reveal_cwd = ".",
				show_help = "g?",
				synchronize = "S",
				trim_left = "<",
				trim_right = ">",
			},
			windows = {
				preview = true,
				max_number = math.huge,
				width_focus = 50,
				width_nofocus = 50,
				width_preview = 50,
			},
		})
	end,
}
