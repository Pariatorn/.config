return {
	"L3MON4D3/LuaSnip",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
    require("luasnip").config.set_config({
      store_selection_keys = "<Tab>",
    })
	end,
}
