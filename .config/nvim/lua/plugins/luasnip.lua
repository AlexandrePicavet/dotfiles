return {
	"L3MON4D3/luaSnip",
	lazy = true,
	version = "v2.*",
	dependencies = { "rafamadriz/friendly-snippets" },
	build = "make install_jsregexp",
	keys = {
		{
			"<C-c>",
			function()
				local ls = require("luasnip")
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end,
			mode = { "i", "s" },
			desc = "Change snippet choice",
		},
	},
}
