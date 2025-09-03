-- define colors
local colors = {
	blue = "#83a598",
	green = "#8ec07c",
	violet = "#d3869b",
	yellow = "#d8a657",
	red = "#FF4A4A",
	cream = "#fff4d2",
	black = "#1d1d1d",
	grey = "#393939",
	dark = "#292929",
}

-- custom modifications
local gruv_material = {
	normal = {
		a = { bg = colors.dark, fg = colors.cream, gui = "bold" },
		b = { bg = colors.grey, fg = colors.cream, gui = "bold" },
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
	terminal = {
		a = { bg = colors.red, fg = colors.black, gui = "bold" },
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

-- plugin
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "VeryLazy" },
	opts = {
		options = {
			theme = gruv_material,
			component_separators = { left = "│", right = "│" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "snacks_dashboard" },
		},
		sections = {
			lualine_a = {
				"mode",
			},
			lualine_b = {
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
						alternate_file = "",
						directory = "",
					},
					mode = 2,
				},
			},
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 3,
					shorting_target = 0,
				},
			},
			lualine_x = {
				"filesize",
			},
			lualine_y = {
				"searchcount",
				"selectioncount",
				"encoding",
				"filetype",
			},
			lualine_z = {
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
	},
	config = function(_, opts)
		require("lualine").setup(opts)
		vim.opt.laststatus = 3
	end,
}
