return {
	"folke/snacks.nvim",
	priority = 1000,
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
						{ key = "SPC n", desc = "Noice" },
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
				style = "compact",
				width = { min = 35, max = 0.8 },
				height = { min = 1, max = 0.8 },
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
	end,
}
