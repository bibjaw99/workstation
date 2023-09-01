-- requring plugin
local installed, Transparent = pcall(require, "transparent")
if not installed then
	vim.notify("Plugin 'transparent.nvim' is not installed")
	return
end

-- Setting up plugin
Transparent.setup({
	groups = { -- table: default groups
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLineNr",
		"EndOfBuffer",
	},
	extra_groups = {
		"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
		"FloatBorder",
		"NvimTreeWinSeparator",
		"NvimTreeNormal",
		"NvimTreeNormalNC",
		"NvimTreeEndOfBuffer",
		"TroubleNormal",
		"TelescopeNormal",
		"TelescopeBorder",
		"WhichKeyFloat",

		-- TODO: programmatically add this
		"NotifyINFOBody",
		"NotifyERRORBody",
		"NotifyWARNBody",
		"NotifyDEBUGBody",
		"NotifyTRACEBody",
		"NotifyINFOBorder",
		"NotifyERRORBorder",
		"NotifyWARNBorder",
		"NotifyDEBUGBorder",
		"NotifyTRACEBorder",
	}, -- table: additional groups that should be cleared
	exclude_groups = {}, -- table: groups you don't want to clear
})
