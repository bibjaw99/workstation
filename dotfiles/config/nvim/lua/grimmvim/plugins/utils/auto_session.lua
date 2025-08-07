return {
	"rmagatti/auto-session",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		enabled = true,
		auto_save = false,
		auto_restore = false,
		suppressed_dirs = {
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
	},
	keys = {
		{
			mode = "n",
			"<leader>ss",
			":SessionSave<CR>",
			desc = "Session Save",
		},
		{
			mode = "n",
			"<leader>sl",
			":Autosession search<cr>",
			desc = "Search Sessions",
		},
		{
			mode = "n",
			"<leader>sd",
			":Autosession delete<cr>",
			desc = "Delete Session",
		},
		{
			mode = "n",
			"<leader>sr",
			":SessionRestore ",
			desc = "Restore Session",
		},
		{
			mode = "n",
			"<leader>sa",
			":SessionToggleAutoSave<CR>",
			desc = "Toggle Autosave Sessions",
		},
		{
			mode = "n",
			"<leader>sD",
			":SessionDisableAutoSave<CR>",
			desc = "Disable Autosave Sessions",
		},
		{
			mode = "n",
			"<leader>sp",
			":SessionPurgeOrphaned<CR>",
			desc = "Purge Orphaned Sessions",
		},
	},
}
