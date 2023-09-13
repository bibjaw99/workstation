return {
	-- emmet
	{
		"mattn/emmet-vim",
	},
	-- lorem ipsum
	{
		"derektata/lorem.nvim",
		config = function()
			local lorem = require("lorem")
			lorem.setup({
				sentenceLength = "mixedShort",
				comma = 1,
			})
		end,
	},
	-- Transparent nvim
	{
		"xiyaowong/transparent.nvim",
	},

	-- rainbow_csv
	{
		"mechatroner/rainbow_csv",
	},
}
