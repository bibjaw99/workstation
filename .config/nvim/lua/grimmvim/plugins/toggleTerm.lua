return {
	"akinsho/toggleterm.nvim",

	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = 15,
			open_mapping = [[<c-\>]],
			shade_filetypes = {},
			shade_terminal = true,
			shading_factor = 1,
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal",
			autochdir = true,
			float_opts = {
				border = "double",
				width = 100,
				height = 20,
			},
		})

		local map = vim.keymap.set
		-- keymaps
		map("n", "<leader>tt", ":ToggleTerm<cr>", { desc = "Terminal Below", noremap = true, silent = true })
		map(
			"n",
			"<leader>tf",
			":ToggleTerm direction=float<cr>",
			{ desc = "Terminal Floating", noremap = true, silent = true }
		)
	end,
}
