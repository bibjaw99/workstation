return {
	"rmagatti/auto-session",
	event = "VeryLazy",
	config = function()
		local map = vim.keymap.set
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
		-- keymap
		map("n", "<leader>ss", ":SessionSave<CR>", { desc = "Sessions Save", noremap = true, silent = true })
		map(
			"n",
			"<leader>sl",
			":Autosession search<cr>",
			{ desc = "Available Sessions", noremap = true, silent = true }
		)
		map("n", "<leader>sd", ":Autosession delete<cr>", { desc = "Delete Sessions", noremap = true, silent = true })
		map("n", "<leader>sr", ":SessionRestore ", { desc = "Restore Sessions", noremap = true, silent = true })
		map(
			"n",
			"<leader>sa",
			":SessionToggleAutoSave<CR>",
			{ desc = "Toggle Autosave Sessions", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>sD",
			":SessionDisableAutoSave<CR>",
			{ desc = "Disable Autosave Sessions", noremap = true, silent = true }
		)
		map(
			"n",
			"<leader>sp",
			":SessionPurgeOrphaned<CR>",
			{ desc = "Purge Orphaned Sessions", noremap = true, silent = true }
		)
	end,
}
