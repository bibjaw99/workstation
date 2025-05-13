return {
	"echasnovski/mini.files",
	version = "*",
	event = "VeryLazy",
	config = function()
		local map = vim.keymap.set
		require("mini.files").setup({
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
				max_number = math.huge,
				width_focus = 50,
				width_nofocus = 50,
				width_preview = 50,
			},
		})

		map(
			"n",
			"<leader>ec",
			":e ~/.config/nvim/lua/grimmvim/<cr>",
			{ desc = "Config Dir", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>et",
			":e ~/.local/share/nvim/mini.files/trash/<cr>",
			{ desc = "MiniFiles Trash", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>eo",
			":lua MiniFiles.open(vim.api.nvim_buf_get_name(0),true)<cr>",
			{ desc = "MiniFiles Current", noremap = true, silent = false }
		)
		map("n", "<leader>ee", ":lua MiniFiles.open()<cr>", { desc = "MiniFiles Open", noremap = true, silent = false })
		map(
			"n",
			"<leader>er",
			":lua MiniFiles.reset()<cr>",
			{ desc = "MiniFiles Reset", noremap = true, silent = false }
		)
		map(
			"n",
			"<leader>es",
			":e ~/Pictures/screenshots/<cr>",
			{ desc = "screenshots", noremap = true, silent = false }
		)
	end,
}
