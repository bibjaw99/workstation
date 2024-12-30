return {
	"rmagatti/auto-session",
	event = "VeryLazy",
	config = function()
		local auto_session = require("auto-session")
		auto_session.setup({
			auto_restore_enabled = false,
			auto_save_enabled = false,
			auto_session_suppress_dirs = {
				"/",
				"~/",
				"~/github",
				"~/Downloads",
				"~/Desktop",
				"~/Documents",
				"~/Pictures",
				"~/Music",
				"~/Videos",
			},
		})
	end,
}
