return {
	"rafamadriz/friendly-snippets",
	config = function()
		require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
		require("luasnip.loaders.from_vscode").lazy_load({})
	end,
}
