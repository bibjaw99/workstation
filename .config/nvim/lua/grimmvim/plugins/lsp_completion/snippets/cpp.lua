local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

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
			{
				i(1, "int i=0"),
				i(2, "i<size"),
				i(3, "i++"),
				i(4),
			}
		)
	),
})

ls.add_snippets("cpp", {
	s(
		"boil",
		fmt(
			[[
      #include <bits/stdc++.h>
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
