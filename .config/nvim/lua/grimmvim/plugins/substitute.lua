return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitute = require("substitute")
		substitute.setup()
		local map = vim.keymap.set
		map("n", "s", substitute.operator, { desc = "Substitute with motion" })
		map("n", "ss", substitute.line, { desc = "Substitute line" })
		map("n", "S", substitute.eol, { desc = "Substitute to end of line" })
		map("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
	end,
}
