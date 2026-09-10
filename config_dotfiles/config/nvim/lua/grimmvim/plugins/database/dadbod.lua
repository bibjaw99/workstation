return {
	"tpope/vim-dadbod",
	ft = { "sql", "mysql", "plsql" },
	dependencies = {
		{ "kristijanhusak/vim-dadbod-ui", ft = { "sql", "mysql", "plsql" } },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},

	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		-- Disable all info notifications
		vim.g.db_ui_disable_info_notifications = 1
	end,

	config = function()
		local map = vim.keymap.set

		-- UI
		map("n", "<leader>Du", "<cmd>DBUIToggle<CR>", { desc = "Dadbod UI", noremap = true, silent = true })
		map(
			"n",
			"<leader>Da",
			"<cmd>DBUIAddConnection<CR>",
			{ desc = "Add DB connection", noremap = true, silent = true }
		)
		map("n", "<leader>Df", "<cmd>DBUIFindBuffer<CR>", { desc = "Find query buffer", noremap = true, silent = true })

		-- Execute SQL
		map("n", "<leader>De", "<cmd>DB<CR>", { desc = "Execute SQL statement", noremap = true, silent = true })
		map("v", "<leader>De", ":DB<CR>", { desc = "Execute selected SQL", noremap = true, silent = true })

		-- Entire file
		map("n", "<leader>DE", "<cmd>%DB<CR>", { desc = "Execute entire SQL file", noremap = true, silent = true })

		-- change highlighting colors
		local hl = vim.api.nvim_set_hl
		hl(0, "NotificationInfo", {
			fg = "#ebdbb2",
			bg = "NONE",
		})
		hl(0, "NotificationWarning", {
			fg = "#d8a657",
			bg = "NONE",
		})
		hl(0, "NotificationError", {
			fg = "#ea6962",
			bg = "NONE",
		})
	end,
}

-- notes :
-- connecting to a postgresql DB : `postgresql://username:password@localhost:portnumber/db_name`
-- example : `postgresql://postgres:password@localhost:5432/my_database`
