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
		-- "preservim/vim-markdown",
		-- dependencies = "godlygeek/tabular",
		-- ft = { "markdown" },
		-- config = function()
		-- 	vim.cmd("let g:vim_markdown_folding_disabled = 1")
		-- 	vim.cmd("let g:vim_markdown_folding_style_pythonic = 1")
		-- 	vim.cmd("let g:vim_markdown_new_list_item_indent = 0")
		-- 	vim.cmd("let g:vim_markdown_auto_insert_bullets = 0")
		-- end,
	},

	-- {
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	opts = {},
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"echasnovski/mini.nvim",
	-- 	}, -- if you use the mini.nvim suite
	-- 	config = function()
	-- 		local renderMarkdown = require("render-markdown")
	-- 		renderMarkdown.setup({
	-- 			heading = {
	-- 				icons = { " 󰎤 ", " 󰎧 ", " 󰎪 ", " 󰎭 ", " 󰎱 ", " 󰎹 " },
	-- 				backgrounds = {
	-- 					"RenderMarkdownH1Bg",
	-- 					"RenderMarkdownH2Bg",
	-- 					"RenderMarkdownH3Bg",
	-- 					"RenderMarkdownH4Bg",
	-- 					"RenderMarkdownH5Bg",
	-- 					"RenderMarkdownH6Bg",
	-- 				},
	-- 				-- The 'level' is used to index into the array using a clamp
	-- 				-- Highlight for the heading and sign icons
	-- 				foregrounds = {
	-- 					"RenderMarkdownH1",
	-- 					"RenderMarkdownH2",
	-- 					"RenderMarkdownH3",
	-- 					"RenderMarkdownH4",
	-- 					"RenderMarkdownH5",
	-- 					"RenderMarkdownH6",
	-- 				},
	-- 			},
	-- 		})
	-- 		-- Changing links of highlight groups
	-- 		vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { link = "IncSearch" })
	-- 		vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { link = "MasonHighlightBlock" })
	-- 		vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { link = "Substitute" })
	-- 		vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { link = "Search" })
	-- 		vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { link = "DiffText" })
	-- 		vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { link = "OctoBubblePurple" })
	-- 	end,
	-- },
}
