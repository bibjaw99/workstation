return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.cmd("let g:mkdp_auto_start = 0")
		vim.cmd("let g:mkdp_refresh_slow = 0")
	end,
	ft = { "markdown" },
}
