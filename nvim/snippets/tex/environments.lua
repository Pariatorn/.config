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
local line_begin = require("luasnip.extras.conditions.expand").line_begin

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

	s(
		{ trig = "fig", dscr = "Figure environment" },
		fmta(
			[[
        \begin{figure}
          \centering
          \includegraphics[width=\textwidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
      ]],
			{ i(1, "path"), i(2), i(3) }
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "figp", dscr = "Figure environment positioned" },
		fmta(
			[[
        \begin{figure}[<>]
          \centering
          \includegraphics[width=\textwidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
      ]],
			{ i(1, "h!"), i(2, "path"), i(3), i(4) }
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "tab", dscr = "Table environment with booktabs" },
		fmta(
			[[
        \begin{table}
          \centering
          \caption{<>}
          \begin{tabular}{<>}
            \toprule
            <>
            \midrule
            <>
            \bottomrule
          \end{tabular}
          \label{tab:<>}
        \end{table}
      ]],
			{ i(1), i(2, "positions"), i(4), i(0), i(3) }
		)
	),
	s(
		{ trig = "tabp", dscr = "Table environment with booktabs positioned" },
		fmta(
			[[
        \begin{table}[<>]
          \centering
          \caption{<>}
          \begin{tabular}{<>}
            \toprule
            <>
            \midrule
            <>
            \bottomrule
          \end{tabular}
          \label{tab:<>}
        \end{table}
      ]],
			{ i(1, "h!"), i(2), i(3, "positions"), i(5), i(0), i(4) }
		)
	),
}
