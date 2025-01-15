return {
	"mbbill/undotree",
	event = "VeryLazy",
	cofig = function()
		local map = vim.keymap.set
		local undotree = require("undotree")
		undotree.setup()
		-- keymaps
		map("n", "<leader>uu", ":UndotreeToggle<cr>", { desc = "UndoTree Toggle", noremap = true, silent = true })
		map("n", "<leader>uf", ":UndotreeFocus<cr>", { desc = "UndoTree Focus", noremap = true, silent = true })
	end,
}
