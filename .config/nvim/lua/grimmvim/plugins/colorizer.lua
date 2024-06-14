return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		vim.o.termguicolors = true
		local colorizer = require("colorizer")

		colorizer.setup()
	end,
}
