return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Tree",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
				diagnostics = "nvim_lsp",
				separator_style = { "", "" },
				modified_icon = "●",
				show_close_icon = false,
				show_buffer_close_icons = false,
			},
			-- highlights = {
			-- 	fill = {
			-- 		fg = "#ebdbb2",
			-- 		bg = "#1d1d1d",
			-- 	},
			-- },
		})
	end,
}
