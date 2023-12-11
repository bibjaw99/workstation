return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		vim.o.background = "dark" -- or "light" for light mode
		vim.cmd("let g:gruvbox_material_background= 'hard'")
		vim.cmd("let g:gruvbox_material_transparent_background=2")
		vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
		vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
	end,
}
