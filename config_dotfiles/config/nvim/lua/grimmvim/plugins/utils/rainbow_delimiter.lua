return {
	"HiPhish/rainbow-delimiters.nvim",
	event = { "BufReadPre", "BufNewFile" },
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
	end,
}
