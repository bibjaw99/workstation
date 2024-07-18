return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local colors = {
			blue = "#83a598",
			green = "#8ec07c",
			violet = "#d3869b",
			yellow = "#d8a657",
			red = "#FF4A4A",
			cream = "#fff4d2",
			black = "#1d1d1d",
			grey = "#444444",
			dark = "#292929",
		}

		local gruv_material = {
			normal = {
				a = { bg = colors.dark, fg = colors.cream, gui = "bold" },
				c = { bg = colors.blue, fg = colors.black, gui = "bold" },
			},
			insert = {
				a = { bg = colors.blue, fg = colors.black, gui = "bold" },
				c = { bg = colors.violet, fg = colors.black, gui = "bold" },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.black, gui = "bold" },
				c = { bg = colors.dark, fg = colors.cream, gui = "bold" },
			},
			command = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				c = { bg = colors.black, fg = colors.cream, gui = "bold" },
			},
			replace = {
				a = { bg = colors.blue, fg = colors.black, gui = "bold" },
				c = { bg = colors.violet, fg = colors.black, gui = "bold" },
			},
			inactive = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				c = { bg = colors.black, fg = colors.cream, gui = "bold" },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = gruv_material,
				component_separators = { left = "", right = "|" },
				section_separators = { left = "", right = "" },
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
							active = { bg = colors.yellow, fg = colors.black, gui = "bold" },
							inactive = { bg = colors.grey, fg = colors.cream, gui = "italic" },
						},
						symbols = {
							modified = " ●",
							alternate_file = " ",
							directory = "",
						},
						mode = 2,
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
