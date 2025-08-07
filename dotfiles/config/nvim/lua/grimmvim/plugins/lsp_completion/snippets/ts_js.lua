local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local try_catch = {
	s(
		"tych",
		fmt(
			[[
      try {{
        {}
      }} catch({}) {{
        {}
      }}
      ]],
			{
				i(1, ""),
				i(2, ""),
				i(3, ""),
			}
		)
	),
}

-- require module
local require = {
	s(
		"req",
		fmt(
			[[
      const {} = require("{}");
      ]],
			{
				i(1, ""),
				i(2, ""),
			}
		)
	),
}

-- express
local rex = {
	s("rex", t('const express = require("express");')),
}

-- express Router
local exrout = {
	s("exrout", t('const router = require("express").Router();')),
}

-- import dotenv
local dotenv = {
	s("dotenv", t('require("dotenv").config();')),
}

ls.add_snippets("javascript", require)
ls.add_snippets("typescript", require)

ls.add_snippets("javascript", try_catch)
ls.add_snippets("typescript", try_catch)

ls.add_snippets("javascript", rex)
ls.add_snippets("typescript", rex)

ls.add_snippets("javascript", exrout)
ls.add_snippets("typescript", exrout)

ls.add_snippets("javascript", dotenv)
ls.add_snippets("typescript", dotenv)
