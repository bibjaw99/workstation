return {
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
}
