return {
	"echasnovski/mini.files",
	version = "*",
	event = "VeryLazy",
	opts = {
		options = {
			permanent_delete = false,
			use_as_default_explorer = true,
		},
		mappings = {
			close = "q",
			go_in = "",
			go_in_plus = "L",
			go_out = "",
			go_out_plus = "H",
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
			-- max_number = math.huge,
			width_focus = 50,
			width_nofocus = 50,
			width_preview = 50,
		},
	},
	keys = {
		{
			mode = "n",
			"<leader>eo",
			":lua MiniFiles.open(vim.api.nvim_buf_get_name(0),true)<cr>",
			desc = "MiniFiles Current",
		},
		{
			mode = "n",
			"<leader>ee",
			":lua MiniFiles.open()<cr>",
			desc = "MiniFiles Open",
		},
		{
			mode = "n",
			"<leader>er",
			":lua MiniFiles.reset()<cr>",
			desc = "MiniFiles Reset",
		},
		{
			mode = "n",
			"<leader>ec",
			":e ~/.config/nvim/lua/grimmvim/<cr>",
			desc = "Config Dir",
		},
		{
			mode = "n",
			"<leader>et",
			":e ~/.local/share/nvim/mini.files/trash/<cr>",
			desc = "MiniFiles Trash",
		},
		{
			mode = "n",
			"<leader>es",
			":e ~/Pictures/screenshots/<cr>",
			desc = "Screenshots dir",
		},
	},
	config = function(_, opts)
		require("mini.files").setup(opts)
	end,
}
