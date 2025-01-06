return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "VeryLazy",
	config = function()
		require("rainbow-delimiters.setup").setup({
			highlight = {
				"RainbowDelimiter1",
				"RainbowDelimiter2",
				"RainbowDelimiter3",
				"RainbowDelimiter4",
				"RainbowDelimiter5",
				"RainbowDelimiter6",
				"RainbowDelimiter7",
			},
		})
		vim.api.nvim_set_hl(0, "RainbowDelimiter1", { fg = "#ea6962" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter2", { fg = "#d8a657" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter3", { fg = "#458588" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter4", { fg = "#8ec07c" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter5", { fg = "#d3869b" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter6", { fg = "#e78a4e" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter7", { fg = "#83a598" })
	end,
}
