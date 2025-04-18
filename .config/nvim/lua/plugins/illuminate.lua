return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	opts = {
		providers = {
			"lsp",
			"treesitter",
		},
		delay = 0,
		under_cursor = false,
		min_count_to_highlight = 2,
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
