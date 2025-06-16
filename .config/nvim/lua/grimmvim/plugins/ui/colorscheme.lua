return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		vim.o.background = "dark" -- or "light" for light mode

		local cmds = {
			"let g:gruvbox_material_background = 'hard'",
			"let g:gruvbox_material_transparent_background = 2",
			"let g:gruvbox_material_diagnostic_line_highlight = 1",
			"let g:gruvbox_material_diagnostic_virtual_text = 'colored'",
			"let g:gruvbox_material_enable_bold = 1",
			"let g:gruvbox_material_enable_italic = 1",
			"colorscheme gruvbox-material",
		}

		for _, cmd in ipairs(cmds) do
			vim.cmd(cmd)
		end
	end,
}
