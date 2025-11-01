-- Highlights the word hovered and its occurrences
return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	opts = {
		providers = {
			"lsp",
			"treesitter",
		},
		delay = 0,
		under_cursor = true,
		min_count_to_highlight = 2,
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
