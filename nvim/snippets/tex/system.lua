local ls = require("luasnip")
local s = ls.snippet
--local sn = ls.snippet_node
--local t = ls.text_node
local i = ls.insert_node
--local f = ls.function_node
--local d = ls.dynamic_node
--local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
--local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.conditions.expand").line_begin

local helpers = require("neotex.core.luasnip-helpers")
local in_mathzone = helpers.in_mathzone
local in_text = helpers.in_text

return {
	-- preamble
	s({ trig = "up", dscr = "usepackage" }, fmta([[\usepackage{<>}]], { i(1) }), { condition = line_begin }),
	s(
		{ trig = "upo", dscr = "usepackage with options" },
		fmta([[\usepackage[<>]{<>}]], { i(1), i(2) }),
		{ condition = line_begin }
	),

	-- sections
	s({ trig = "sec", dscr = "section" }, fmta([[\section{<>}]], { i(1) }), { condition = line_begin }),
	s({ trig = "ssec", dscr = "subsection" }, fmta([[\subsection{<>}]], { i(1) }), { condition = line_begin }),
	s({ trig = "sssec", dscr = "subsubsection" }, fmta([[\subsubsection{<>}]], { i(1) }), { condition = line_begin }),
	s({ trig = "par", dscr = "paragraph" }, fmta([[\paragraph{<>}]], { i(1) }), { condition = line_begin }),

	-- labels and references
	s({ trig = "lab", dscr = "label" }, fmta([[\label{<>}]], { i(1) })),
	s({ trig = "flab", dscr = "Figure label" }, fmta([[\label{fig:<>}]], { i(1) }), { condition = in_text }),
	s({ trig = "elab", dscr = "Equation label" }, fmta([[\label{eq:<>}]], { i(1) }), { condition = in_mathzone }),
	s({ trig = "tlab", dscr = "Tabular label" }, fmta([[\label{tab:<>}]], { i(1) }), { condition = in_text }),

	s({ trig = "ref", dscr = "reference" }, fmta([[\ref{<>}]], { i(1) }), { condition = in_text }),
	s({ trig = "fref", dscr = "Figure reference" }, fmta([[\ref{fig:<>}]], { i(1) }), { condition = in_text }),
	s({ trig = "eref", dscr = "Equation reference" }, fmta([[\ref{eq:<>}]], { i(1) }), { condition = in_text }),
	s({ trig = "tref", dscr = "Tabular reference" }, fmta([[\ref{tab:<>}]], { i(1) }), { condition = in_text }),

	s({ trig = "cit", dscr = "Cite" }, fmta([[\cite{<>}]], { i(1) }), { condition = in_text }),
}
