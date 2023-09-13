return {
	"windwp/nvim-autopairs",
	config = function()
		local nvim_autopairs = require("nvim-autopairs")
		local nvim_autopairs_completion = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		nvim_autopairs.setup({
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
		cmp.event:on("confirm_done", nvim_autopairs_completion.on_confirm_done())
	end,
}
