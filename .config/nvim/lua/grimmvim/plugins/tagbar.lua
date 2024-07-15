return {
	"preservim/tagbar",
	event = "VeryLazy",
	config = function()
		local map = vim.keymap.set
		-- nvim tagbar
		map("n", "<leader>Tf", ":TagbarToggle<cr>", { desc = "Tagbar Toggle", noremap = true, silent = true })
	end,
}
