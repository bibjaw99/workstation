return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local custom_gruvbox = require("lualine.themes.gruvbox")
		custom_gruvbox.normal.a.bg = "#282828"
		custom_gruvbox.normal.a.fg = "#fff4d2"
		custom_gruvbox.normal.a.gui = ""
		custom_gruvbox.normal.c.bg = "#83a598"
		custom_gruvbox.normal.c.fg = "#1d1d1d"
		custom_gruvbox.normal.c.gui = "bold"
		custom_gruvbox.insert.c.bg = "#d3869b"
		custom_gruvbox.insert.c.fg = "#1d1d1d"
		custom_gruvbox.insert.c.gui = "bold"
		custom_gruvbox.visual.c.bg = "#292929"
		custom_gruvbox.visual.c.fg = "#fff4d2"
		custom_gruvbox.visual.c.gui = "bold"
		custom_gruvbox.command.a.bg = "#8ec07c"
		custom_gruvbox.command.a.fg = "#1d1d1d"
		custom_gruvbox.command.c.gui = "bold"
		custom_gruvbox.command.c.bg = "#1d1d1d"
		custom_gruvbox.command.c.fg = "#ebdbb2"
		-- setting up lualine
		lualine.setup({

			options = {
				icons_enabled = true,
				theme = "gruvbox",
				component_separators = { left = "", right = "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					"mode",
					"branch",
					"diff",
					"diagnostics",
					{
						"buffers",
						buffers_color = {
							active = { bg = "#d8a657", fg = "#1d1d1d", gui = "bold" },
							inactive = { bg = "#444444", fg = "#fff4d2", gui = "italic" },
						},
						symbols = {
							modified = " ●",
							alternate_file = " ",
							directory = "",
						},
					},
				},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 3,
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					"searchcount",
					"selectioncount",
					"encoding",
					"fileformat",
					"filetype",
					"progress",
					"location",
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
