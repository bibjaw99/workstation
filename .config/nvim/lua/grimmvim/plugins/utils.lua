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
	-- rainbow_csv
	{
		"mechatroner/rainbow_csv",
	},
  -- nvim undotree
  {
    "mbbill/undotree",
    cofig = function()
      local undotree = require("undotree")
      undotree.setup()
    end,
  },
}
