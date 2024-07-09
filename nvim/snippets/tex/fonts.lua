local ls = require("luasnip")
local s = ls.snippet
--local sn = ls.snippet_node
--local t = ls.text_node
--local i = ls.insert_node
--local f = ls.function_node
local d = ls.dynamic_node
--local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
--local rep = require("luasnip.extras").rep

local helpers = require("neotex.core.luasnip-helpers")
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_text = helpers.in_text

return {
	s({ trig = "tit" }, fmta("\\textit{<>}", { d(1, get_visual) }), { condition = in_text }),
	s({ trig = "tbf" }, fmta("\\textbf{<>}", { d(1, get_visual) }), { condition = in_text }),
	s({ trig = "mrm" }, fmta("\\mathrm{<>}", { d(1, get_visual) }), { condition = in_mathzone }),
	s({ trig = "mbf" }, fmta("\\mathbf{<>}", { d(1, get_visual) }), { condition = in_mathzone }),
	s({ trig = "mbb" }, fmta("\\mathbb{<>}", { d(1, get_visual) }), { condition = in_mathzone }),

	s({ trig = "tsub" }, fmta("\\textsubscript{<>}", { d(1, get_visual) }), { condition = in_text }),
	s({ trig = "tsup" }, fmta("\\textsuperscript{<>}", { d(1, get_visual) }), { condition = in_text }),
}
