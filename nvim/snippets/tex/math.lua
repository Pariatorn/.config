local ls = require("luasnip")
local s = ls.snippet
--local sn = ls.snippet_node
--local t = ls.text_node
local i = ls.insert_node
--local f = ls.function_node
--local d = ls.dynamic_node
--local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local helpers = require("neotex.core.luasnip-helpers")
local in_mathzone = helpers.in_mathzone

return {
	-- operators
	s({ trig = "ff" }, fmta("\\frac{<>}{<>}", { i(1), i(2) }), { condition = in_mathzone }),
	s({ trig = "sq" }, fmta("\\sqrt{<>}", { i(1) }), { condition = in_mathzone }),

	s(
		{ trig = "intt", dscr = "integral with upper and lower limit" },
		fmta("\\int_{<>}^{<>}<>\\mathrm{\\mathstrut d<>}", { i(1), i(2), i(0), i(3) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "innt", dscr = "integral with symmetric upper and lower limit" },
		fmta("\\int_{-<>}^{<>}<>\\mathrm{\\mathstrut d<>}", { i(1), rep(1), i(0), i(2) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "sum", dscr = "sum with lower limit" },
		fmta("\\sum_{<>} <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "summ", dscr = "sum with upper and lower limit" },
		fmta("\\sum_{<>}^{<>} <>", { i(1), i(2), i(0) }),
		{ condition = in_mathzone }
	),

	-- typesetting
	s({ trig = "sub" }, fmta("_{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "subr" }, fmta("_{\\mathrm{<>}}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "sup" }, fmta("^{<>}", { i(1) }), { condition = in_mathzone }),
}
