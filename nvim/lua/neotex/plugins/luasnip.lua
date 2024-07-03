return {
	"L3MON4D3/LuaSnip",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
	end,
}
