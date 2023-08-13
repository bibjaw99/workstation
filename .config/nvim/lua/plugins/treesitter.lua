require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"html",
		"css",
		"python",
		"markdown",
		"markdown_inline",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	autotag = {
		enable = true,
	},

	autopairs = {
		enable = true,
	},

	rainbow = {
		enable = true,
	},

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
