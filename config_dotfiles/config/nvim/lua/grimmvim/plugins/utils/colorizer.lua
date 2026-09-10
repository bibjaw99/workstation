return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.o.termguicolors = true
		require("colorizer").setup({
			options = {
				parsers = {
					css = true,
					tailwind = { enable = true },
				},
				display = {
					mode = "virtualtext",
					virtualtext = { position = "after" },
				},
			},
		})
	end,
}
