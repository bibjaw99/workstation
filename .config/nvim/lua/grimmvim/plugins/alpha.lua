return {

	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                                       ]],
			[[ ╔═══════════════════════════════════════════════════════════════════════════════════╗ ]],
			[[ ║                                                                                   ║ ]],
			[[ ║  ██████╗   ██████╗   ██╗  ███╗   ███╗  ███╗   ███╗    ██╗   ██╗  ██╗  ███╗   ███╗ ║ ]],
			[[ ║ ██╔════╝   ██╔══██╗  ██║  ████╗ ████║  ████╗ ████║    ██║   ██║  ██║  ████╗ ████║ ║ ]],
			[[ ║ ██║  ███╗  ██████╔╝  ██║  ██╔████╔██║  ██╔████╔██║    ██║   ██║  ██║  ██╔████╔██║ ║ ]],
			[[ ║ ██║   ██║  ██╔══██╗  ██║  ██║╚██╔╝██║  ██║╚██╔╝██║    ╚██╗ ██╔╝  ██║  ██║╚██╔╝██║ ║ ]],
			[[ ║ ╚██████╔╝  ██║  ██║  ██║  ██║ ╚═╝ ██║  ██║ ╚═╝ ██║     ╚████╔╝   ██║  ██║ ╚═╝ ██║ ║ ]],
			[[ ║  ╚═════╝   ╚═╝  ╚═╝  ╚═╝  ╚═╝     ╚═╝  ╚═╝     ╚═╝      ╚═══╝    ╚═╝  ╚═╝     ╚═╝ ║ ]],
			[[ ╚═══════════════════════════════════════════════════════════════════════════════════╝ ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("SPC o", "Options"),
			dashboard.button("SPC f", "Telescope"),
			dashboard.button("SPC s", "Session"),
			dashboard.button("SPC b", "Buffers"),
			dashboard.button("SPC e", "Filetree"),
			dashboard.button("SPC l", "LSP"),
			dashboard.button("SPC p", "Window"),
			dashboard.button("SPC g", "Gitsigns"),
		}
		_Gopts = {
			position = "center",
			hl = "Type",
			-- wrap = "overflow";
		}

		local function footer()
			return "Programming is an art of patience not talent"
		end

		dashboard.section.footer.val = footer()

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
