-- requiring necessary functions
local installed, NvimAutoPairs = pcall(require, "nvim-autopairs")
if not installed then
	vim.notify("Plugin 'nvim-autopairs' not installed")
end

local installed, NvimAutoPairsCompletion = pcall(require, "nvim-autopairs.completion.cmp")
if not installed then
	vim.notify("Plugin 'nvim-autopairs' not installed")
end

local installed, Cmp = pcall(require, "cmp")
if not installed then
	vim.notify("Plugin 'nvim-cmp' not installed")
end

-- ######################################################################################################
-- Plugin setups
NvimAutoPairs.setup({
	check_ts = true,
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
	auto_select = false, -- auto select first item
	map_char = {
		-- modifies the function or method delimiter by filetypes
		all = "(",
		tex = "{",
	},
})

-- If you want insert `(` after select function or method item
Cmp.event:on("confirm_done", NvimAutoPairsCompletion.on_confirm_done())
