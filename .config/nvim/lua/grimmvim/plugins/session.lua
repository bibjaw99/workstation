return {
	"rmagatti/auto-session",
	dependencies = {
		"nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
	},
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
			session_lens = {
				-- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
				buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session when a new one is loaded
			},
			vim.keymap.set("n", "<leader>sl", require("auto-session.session-lens").search_session, {
				desc = "Session List",
				noremap = true,
			}),
		})
	end,
}
