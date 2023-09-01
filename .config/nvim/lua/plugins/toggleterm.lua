-- requring plugin
local installed, ToggleTerm = pcall(require, "toggleterm")
if not installed then
	vim.notify("Plugin 'toggleterm' is not installed")
	return
end

-- #####################################################
-- Setting up toggleterm
ToggleTerm.setup({
	size = 13,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	shade_terminal = true,
	shading_factor = 1,
	start_in_insert = true,
	persist_size = true,
	direction = "horizontal",
	autochdir = true,
})
