return {
	{
		"iamcco/markdown-preview.nvim",
		event = "VeryLazy",
		ft = { "markdown" },
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.cmd("let g:mkdp_theme = 'light'")
			vim.cmd("let g:mkdp_auto_start = 0")
			vim.cmd("let g:mkdp_refresh_slow = 0")
			vim.cmd("let g:mkdp_auto_close = 0")
		end,
	},
}
