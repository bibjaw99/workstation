local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

-- express Router
local exrout = {
	s("exrout", t('const router = require("express").Router();')),
}

-- import dotenv
local dotenv = {
	s("dotenv", t('require("dotenv").config();')),
}

ls.add_snippets("javascript", exrout)
ls.add_snippets("typescript", exrout)

ls.add_snippets("javascript", dotenv)
ls.add_snippets("typescript", dotenv)
