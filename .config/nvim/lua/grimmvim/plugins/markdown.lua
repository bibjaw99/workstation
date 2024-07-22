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

	{
		"preservim/vim-markdown",
		dependencies = "godlygeek/tabular",
		ft = { "markdown" },
		config = function()
			vim.cmd("let g:vim_markdown_folding_disabled = 1")
			vim.cmd("let g:vim_markdown_folding_style_pythonic = 1")
			vim.cmd("let g:vim_markdown_new_list_item_indent = 0")
			vim.cmd("let g:vim_markdown_auto_insert_bullets = 0")
		end,
	},
}
