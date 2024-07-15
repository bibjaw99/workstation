return {
	{
		"iamcco/markdown-preview.nvim",
		event = "VeryLazy",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.cmd("let g:mkdp_auto_start = 0")
			vim.cmd("let g:mkdp_refresh_slow = 0")
			vim.cmd("let g:mkdp_theme= 'light'")
		end,
		ft = { "markdown" },
	},

	{
		"preservim/vim-markdown",
		dependencies = "godlygeek/tabular",

		config = function()
			vim.cmd("let g:vim_markdown_folding_disabled = 1")
			vim.cmd("let g:vim_markdown_folding_style_pythonic = 1")
		end,
	},

	--- Image preview in neovim
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
	},
	{
		"3rd/image.nvim",
		dependencies = { "luarocks.nvim" },
		config = function()
			local img = require("image")
			img.setup({
				backend = "ueberzug",
				-- backend = "kitty",
				integrations = {
					markdown = {
						enabled = true,
						clear_in_insert_mode = false,
						download_remote_images = true,
						only_render_image_at_cursor = true,
						filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
					},
				},
			})
		end,
	},
}
