-- define colors
local colors = {
	gruvBlue = "#83a598",
	gruvGreen = "#8ec07c",
	gruvPink = "#d3869b",
	gruvYellow = "#d8a657",
	gruvRed = "#FF4A4A",
	gruvWhite = "#fff4d2",
	gruvBlack = "#1d1d1d",
	gruvGray = "#393939",
	gruvDark = "#292929",
}

-- custom modifications
local gruv_material = {
	normal = {
		a = { bg = colors.gruvDark, fg = colors.gruvWhite, gui = "bold" },
		b = { bg = colors.gruvGray, fg = colors.gruvWhite, gui = "bold" },
		c = { bg = colors.gruvBlue, fg = colors.gruvBlack, gui = "bold" },
	},
	insert = {
		a = { bg = colors.gruvBlue, fg = colors.gruvBlack, gui = "bold" },
		c = { bg = colors.gruvPink, fg = colors.gruvBlack, gui = "bold" },
	},
	visual = {
		a = { bg = colors.gruvPink, fg = colors.gruvBlack, gui = "bold" },
		c = { bg = colors.gruvDark, fg = colors.gruvWhite, gui = "bold" },
	},
	command = {
		a = { bg = colors.gruvGreen, fg = colors.gruvBlack, gui = "bold" },
		c = { bg = colors.gruvBlack, fg = colors.gruvWhite, gui = "bold" },
	},
	terminal = {
		a = { bg = colors.gruvRed, fg = colors.gruvBlack, gui = "bold" },
		c = { bg = colors.gruvBlack, fg = colors.gruvWhite, gui = "bold" },
	},
	replace = {
		a = { bg = colors.gruvBlue, fg = colors.gruvBlack, gui = "bold" },
		c = { bg = colors.gruvPink, fg = colors.gruvBlack, gui = "bold" },
	},
	inactive = {
		a = { bg = colors.gruvGreen, fg = colors.gruvBlack, gui = "bold" },
		c = { bg = colors.gruvBlack, fg = colors.gruvWhite, gui = "bold" },
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
			component_separators = { left = "|", right = "|" },
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
						active = { bg = colors.gruvYellow, fg = colors.gruvBlack, gui = "bold" },
						inactive = { bg = colors.gruvGray, fg = colors.gruvWhite, gui = "italic" },
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
				},
			},
			lualine_x = {
				"filesize",
			},
			lualine_y = {
				"searchcount",
				"selectioncount",
				"lsp_status",
				"filetype",
			},
			lualine_z = {
				"encoding",
				"location",
			},
		},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
		vim.opt.laststatus = 3
	end,
}
