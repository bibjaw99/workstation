return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = false,
		numhl = true,
	},
	keys = {
		{
			mode = "n",
			"<leader>gg",
			":Gitsigns<CR>",
			desc = "Gitsigns Options",
		},
		{
			mode = "n",
			"<leader>gl",
			":Gitsigns toggle_linehl<CR>",
			desc = "Gitsigns Line Highlight",
		},
		{
			mode = "n",
			"<leader>gw",
			":Gitsigns toggle_word_diff<CR>",
			desc = "Gitsigns Word Difference",
		},
		{
			mode = "n",
			"<leader>gd",
			":Gitsigns toggle_deleted<CR>",
			desc = "Gitsigns Toggle Deleted",
		},
		{
			mode = "n",
			"<leader>gh",
			":Gitsigns preview_hunk<CR>",
			desc = "Gitsigns Preview Hunk",
		},
		{
			mode = "n",
			"<leader>gp",
			":Gitsigns prev_hunk<CR>",
			desc = "Gitsigns Previous Hunk",
		},
		{
			mode = "n",
			"<leader>gn",
			":Gitsigns next_hunk<CR>",
			desc = "Gitsigns Next Hunk",
		},
		{
			mode = "n",
			"<leader>gr",
			":Gitsigns refresh<CR>",
			desc = "Gitsigns Refresh",
		},
		{
			mode = "n",
			"<leader>gH",
			":Gitsigns diffthis<CR>",
			desc = "Gitsigns Compare History",
		},
	},
}
