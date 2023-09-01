local installed, BufferLine = pcall(require, "bufferline")
if not installed then
	vim.notify("Plugin 'bufferline' not installed")
	return
end
BufferLine.setup()
