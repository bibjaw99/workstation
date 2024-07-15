return {
	"lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
		})
	end,
}
