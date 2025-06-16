local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

-- react snippets
ls.add_snippets("javascriptreact", {
	s(
		"compo",
		fmt(
			[[ 
      const {} = ({}) => {{
        {}
        return(
          <div>
          {} 
          </div>
        )
      }}
      export {{ {} }};
      ]],
			{
				i(1, "Compo"),
				i(2, ""),
				i(0, ""),
				i(3, ""),
				rep(1, "Compo"),
			}
		)
	),
})

ls.add_snippets("javascriptreact", {
	s(
		"img",
		fmt(
			[[ 
      <img src="{}" alt="{}" />
      ]],
			{
				i(1),
				i(2),
			}
		)
	),
})

ls.add_snippets("javascriptreact", {
	s(
		"input",
		fmt(
			[[ 
      <input type="{}" name="{}" />
      ]],
			{
				i(1, "text"),
				i(2, "name"),
			}
		)
	),
})

ls.add_snippets("javascriptreact", {
	s("hr", t("<hr />")),
})

ls.add_snippets("javascriptreact", {
	s("br", t("<br />")),
})
