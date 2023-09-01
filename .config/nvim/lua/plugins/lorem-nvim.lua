-- requring plugin
local installed, LoremIpsum = pcall(require, "lorem")
if not installed then
	vim.notify("Plugin 'lorem' not installed")
	return
end

-- Setting up lorem
LoremIpsum.setup({
	sentenceLength = "mixedShort",
	comma = 1,
})
