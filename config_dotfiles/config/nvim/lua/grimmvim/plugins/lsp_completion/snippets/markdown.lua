local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local todo = {
	s(
		"do",
		fmt(
			[[
       - [ ] {}
      ]],
			{
				i(1),
			}
		)
	),
}

ls.add_snippets("markdown", todo)
