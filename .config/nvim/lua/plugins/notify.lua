-- requring plugin
local installed, NvimNotify = pcall(require, "notify")
if not installed then
	vim.notify("Plugin 'nvim-notify' not installed")
	return
end

-- Setting up nvim-notify
NvimNotify.setup({
	minimum_width = 50,
	background_colour = "#00000000",
	stages = "fade",
	timeout = 2000,
	fps = 60,
})
