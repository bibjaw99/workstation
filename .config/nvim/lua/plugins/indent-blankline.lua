vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#458588 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#fe8019 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#b16286 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#689d6a gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#d79921 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#b8bb26 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent7 guifg=#fb4934 gui=nocombine]])

require("indent_blankline").setup({
	opts = {
		show_trailing_blankline_indent = false,
	},
	filetype_exclude = {
		"help",
		"alpha",
		"dashboard",
		"neo-tree",
		"Trouble",
		"lazy",
		"lsp-installer",
		"termianl",
		"NvimTree",
		"mason",
	},

	buftype_exclude = { "terminal" },
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = false,
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
})
