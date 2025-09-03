return {
	"preservim/tagbar",
	event = { "LspAttach" },
	config = function()
		local map = vim.keymap.set
		-- keymap
		map("n", "<leader>Tf", ":Tagbar<cr>", { desc = "Tagbar Toggle", noremap = true, silent = true })
	end,
}
