return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		vim.o.background = "dark" -- or "light" for light mode
		vim.cmd("let g:gruvbox_material_background= 'hard'")
		vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
	end,
}
