local hl = vim.api.nvim_set_hl
local cmd = vim.cmd

cmd([[highlight WinSeparator guibg = None]])
cmd([[highlight CursorLine guibg = None]])
cmd([[highlight CursorLineNr guifg = #d8a657]])

-- changing bg and border colors
hl(0, "FloatBorder", { link = "Normal" })
hl(0, "LspInfoBorder", { link = "Normal" })
hl(0, "NormalFloat", { link = "Normal" })
hl(0, "Pmenu", { link = "Normal" })
hl(0, "PmenuSel", { link = "Search" })

-- -- blink cmp
hl(0, "BlinkCmpMenu", { link = "Normal" })
hl(0, "BlinkCmpMenuBorder", { link = "Normal" })
hl(0, "BlinkCmpMenuSelection", { link = "Search" })
hl(0, "BlinkCmpLabelMatch", { link = "Search" })

-- -- snacks dashboard
hl(0, "SnacksDashboardHeader", { fg = "#d8a657" })
hl(0, "SnacksDashboardDesc", { fg = "#83a598" })
hl(0, "SnacksDashboardFooter", { fg = "#d8a657" })
--
-- -- snacks indentline
hl(0, "SnacksIndent1", { fg = "#ea6962" })
hl(0, "SnacksIndent2", { fg = "#d8a657" })
hl(0, "SnacksIndent3", { fg = "#458588" })
hl(0, "SnacksIndent4", { fg = "#8ec07c" })
hl(0, "SnacksIndent5", { fg = "#d3869b" })
hl(0, "SnacksIndent6", { fg = "#e78a4e" })
hl(0, "SnacksIndent7", { fg = "#83a598" })
--
-- -- snacks picker
hl(0, "SnacksPickerDir", { fg = "#928374" })
--
-- rainbow delimiter
hl(0, "RainbowDelimiter1", { fg = "#ea6962" })
hl(0, "RainbowDelimiter2", { fg = "#d8a657" })
hl(0, "RainbowDelimiter3", { fg = "#458588" })
hl(0, "RainbowDelimiter4", { fg = "#8ec07c" })
hl(0, "RainbowDelimiter5", { fg = "#d3869b" })
hl(0, "RainbowDelimiter6", { fg = "#e78a4e" })
hl(0, "RainbowDelimiter7", { fg = "#83a598" })
