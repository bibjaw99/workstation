local installed, Colorizer = pcall(require, "colorizer")
if not installed then
	vim.notify("Plugin 'colorizer' not installed")
	return
end
Colorizer.setup()
