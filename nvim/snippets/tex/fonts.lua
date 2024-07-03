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

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local in_text = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() ~= 1
end

return {
	s({ trig = "tit" }, fmta("\\textit{<>}", { i(1) }), { condition = in_text }),
	s({ trig = "tbf" }, fmta("\\textbf{<>}", { i(1) }), { condition = in_text }),
	s({ trig = "mrm" }, fmta("\\mathrm{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "mbf" }, fmta("\\mathbf{<>}", { i(1) }), { condition = in_mathzone }),
	s({ trig = "mbb" }, fmta("\\mathbb{<>}", { i(1) }), { condition = in_mathzone }),
}
