return {
	"folke/snacks.nvim",
	-- priority = 1000,
	lazy = false,
	config = function()
		local snacks = require("snacks")
		snacks.setup({
			-- ====================
			-- dashboard setup
			-- ====================
			dashboard = {
				enabled = true,
				preset = {
					header = [[

╔═══════════════════════════════════════════════════════════════════════════════════╗
║                                                                                   ║
║  ██████╗   ██████╗   ██╗  ███╗   ███╗  ███╗   ███╗    ██╗   ██╗  ██╗  ███╗   ███╗ ║
║ ██╔════╝   ██╔══██╗  ██║  ████╗ ████║  ████╗ ████║    ██║   ██║  ██║  ████╗ ████║ ║
║ ██║  ███╗  ██████╔╝  ██║  ██╔████╔██║  ██╔████╔██║    ██║   ██║  ██║  ██╔████╔██║ ║
║ ██║   ██║  ██╔══██╗  ██║  ██║╚██╔╝██║  ██║╚██╔╝██║    ╚██╗ ██╔╝  ██║  ██║╚██╔╝██║ ║
║ ╚██████╔╝  ██║  ██║  ██║  ██║ ╚═╝ ██║  ██║ ╚═╝ ██║     ╚████╔╝   ██║  ██║ ╚═╝ ██║ ║
║  ╚═════╝   ╚═╝  ╚═╝  ╚═╝  ╚═╝     ╚═╝  ╚═╝     ╚═╝      ╚═══╝    ╚═╝  ╚═╝     ╚═╝ ║
╚═══════════════════════════════════════════════════════════════════════════════════╝
        ]],
					keys = {
						{ key = "SPC o", desc = "Options" },
						{ key = "SPC f", desc = "Fuzzy Find" },
						{ key = "SPC s", desc = "Session" },
						{ key = "SPC b", desc = "Beffers" },
						{ key = "SPC e", desc = "Filetree" },
						{ key = "SPC l", desc = "LSP" },
						{ key = "SPC p", desc = "Window" },
						{ key = "SPC g", desc = "Gitsigns" },
					},
				},
				formats = {
					footer = { "%s", align = "center" },
					header = { "%s", align = "center" },
				},
			}, -- dashboard ends

			-- ====================
			-- Notifications setup
			-- ====================
			notifier = {
				enabled = true,
				timeout = 2000,
			}, -- notifier ends

			-- ====================
			-- Indent setup
			-- ====================
			indent = {
				enabled = true,
				animate = {
					enabled = false,
				},
				scope = {
					enabled = false,
				},
				-- can be a list of hl groups to cycle through
				indent = {
					hl = {
						"SnacksIndent1",
						"SnacksIndent2",
						"SnacksIndent3",
						"SnacksIndent4",
						"SnacksIndent5",
						"SnacksIndent6",
						"SnacksIndent7",
					},
				},
			},
			bigfile = {
				enabled = true,
			},
			lazygit = {
				enabled = false,
			},
			terminal = {
				enabled = false,
			},
			dim = {
				enabled = false,
			},
			zen = {
				enabled = false,
			},
			input = {
				enabled = true,
			},
			quickfile = {
				enabled = false,
			},
			scroll = {
				enabled = false,
			},
			statuscolumn = {
				enabled = false,
			},
			words = {
				enabled = false,
			},
		})
		vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#d8a657" })
		vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#83a598" })
		vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#d8a657" })

		-- indent highlight
		vim.api.nvim_set_hl(0, "SnacksIndent1", { fg = "#ea6962" })
		vim.api.nvim_set_hl(0, "SnacksIndent2", { fg = "#fabd2f" })
		vim.api.nvim_set_hl(0, "SnacksIndent3", { fg = "#458588" })
		vim.api.nvim_set_hl(0, "SnacksIndent4", { fg = "#8ec07c" })
		vim.api.nvim_set_hl(0, "SnacksIndent5", { fg = "#b8bb26" })
		vim.api.nvim_set_hl(0, "SnacksIndent6", { fg = "#e78a4e" })
		vim.api.nvim_set_hl(0, "SnacksIndent7", { fg = "#83a598" })
	end,
}
