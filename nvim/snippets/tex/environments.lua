local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.conditions.expand").line_begin

local helpers = require("neotex.core.luasnip-helpers")
local in_text = helpers.in_text

-- TODO: add templates for figure, table
return {
	s(
		{ trig = "beg", dscr = "Generic environment" },
		fmta(
			[[
        \begin{<>}
          <>
        \end{<>}
      ]],
			{ i(1), i(0), rep(1) }
		)
	),
	s(
		{ trig = "ali", dscr = "Align environment (numbered)" },
		fmta(
			[[
        \begin{align}
          <>
          /label{eq:<>}
        \end{align}
      ]],
			{ i(0), i(1) }
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "alis", dscr = "Align environment (unnumbered)" },
		fmta(
			[[
        \begin{align*}
          <>
        \end{align*}
      ]],
			{ i(0) }
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "itt", dscr = "Itemize environment" },
		fmta(
			[[
        \begin{itemize}
          \item <>
        \end{itemize}
      ]],
			{ i(0) }
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "enum", dscr = "Enumerate environment" },
		fmta(
			[[
        \begin{enumerate}
          \item <>
        \end{enumerate}
      ]],
			{ i(0) }
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "enumc", dscr = "Enumerate environment custom label" },
		fmta(
			[[
        \begin{enumerate}[\label=<>]
          \item <>
        \end{enumerate}
      ]],
			{ i(1, "alph*"), i(0) }
		),
		{ condition = line_begin }
	),
}
