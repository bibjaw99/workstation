return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function()
		local map = vim.keymap.set
		require("gitsigns").setup({
			current_line_blame = false,
			numhl = true,
		})
		-- keymaps
		map("n", "<leader>gg", ":Gitsigns<cr>", { desc = "Gitsigns Options", noremap = true, silent = true })
		map(
			"n",
			"<leader>gl",
			":Gitsigns toggle_linehl<cr>",
			{ desc = "Gitsigns Line Highlight", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>gw",
			":Gitsigns toggle_word_diff<cr>",
			{ desc = "Gitsigns Word Difference", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>gd",
			":Gitsigns toggle_deleted<cr>",
			{ desc = "Gitsigns Toggle Deleted", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>gh",
			":Gitsigns preview_hunk<cr>",
			{ desc = "Gitsigns Preview Hunk", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>gp",
			":Gitsigns prev_hunk<cr>",
			{ desc = "Gitsigns Previous Hunk", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>gn",
			":Gitsigns next_hunk<cr>",
			{ desc = "Gitsigns Next Hunk", noremap = true, silent = true }
		)
		map("n", "<leader>gr", ":Gitsigns refresh<cr>", { desc = "Gitsigns Refresh", noremap = true, silent = true })
		map(
			"n",
			"<leader>gH",
			":Gitsigns diffthis<cr>",
			{ desc = "Gitsigns Compare History", noremap = true, silent = true }
		)
	end,
}
