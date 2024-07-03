-- ~/.config/nvim/lua/neotex/core/luasnip-helpers.lua
-- Helper functions for snippets

local M = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

function M.get_visual(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return sn(nil, i(1))
	end
end

function M.in_mathzone()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

function M.in_text()
	return vim.fn["vimtex#syntax#in_mathzone"]() ~= 1
end

return M
