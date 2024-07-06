return {
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local sn = ls.snippet_node
		local isn = ls.indent_snippet_node
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		local c = ls.choice_node
		local d = ls.dynamic_node
		local r = ls.restore_node
		local events = require("luasnip.util.events")
		local ai = require("luasnip.nodes.absolute_indexer")
		local extras = require("luasnip.extras")
		local l = extras.lambda
		local rep = extras.rep
		local p = extras.partial
		local m = extras.match
		local n = extras.nonempty
		local dl = extras.dynamic_lambda
		local fmt = require("luasnip.extras.fmt").fmt
		local fmta = require("luasnip.extras.fmt").fmta
		local conds = require("luasnip.extras.expand_conditions")
		local postfix = require("luasnip.extras.postfix").postfix
		local types = require("luasnip.util.types")
		local parse = require("luasnip.util.parser").parse_snippet
		local ms = ls.multi_snippet
		local k = require("luasnip.nodes.key_indexer").new_key

		-- keybindings

		vim.keymap.set({ "i" }, "<c-y>", function()
			ls.expand()
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<c-]>", function()
			ls.jump(1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<c-[>", function()
			ls.jump(-1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<c-c>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })

		-- #########################
		-- custom snippets here
		-- #########################

		-- CPP Snippets
		ls.add_snippets("cpp", {
			s(
				"cfor",
				fmt(
					[[
            for ( {}; {}; {} ) {{
              {}
            }}
          ]],
					{ i(1, "int i=0"), i(2, "i<size"), i(3, "i++"), i(4) }
				)
			),
		})
		ls.add_snippets("cpp", {
			s(
				"temp",
				fmt(
					[[
            #include <cmath>
            #include <cstring>
            #include <iostream>
            using namespace std;

            int main() {{
              {}
              return 0;
            }}
          ]],
					{ i(1) }
				)
			),
		})
	end,
}
