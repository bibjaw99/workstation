return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	config = function()
		local map = vim.keymap.set
		vim.g.mkdp_filetypes = { "markdown" }
		vim.cmd("let g:mkdp_theme = 'light'")
		vim.cmd("let g:mkdp_auto_start = 0")
		vim.cmd("let g:mkdp_refresh_slow = 0")
		vim.cmd("let g:mkdp_auto_close = 0")

		-- keymaps
		map("n", "<leader>om", ":MarkdownPreview<cr>", { desc = "Markdown Preview", noremap = true, silent = true })
	end,
}
