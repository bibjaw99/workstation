return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		vim.o.background = "dark" -- or "light" for light mode
		vim.cmd("let g:gruvbox_material_background= 'hard'")
		vim.cmd("let g:gruvbox_material_transparent_background=2")
		vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
		vim.cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
		vim.cmd("let g:gruvbox_material_enable_bold=1")
		vim.cmd("let g:gruvbox_material_enable_italic=1")
		vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
	end,
}
