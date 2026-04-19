-- Highlights the word hovered and its occurrences
return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	opts = {
		providers = {
			"lsp",
			-- https://github.com/RRethy/vim-illuminate/issues/247
			-- "treesitter",
		},
		delay = 0,
		under_cursor = true,
		min_count_to_highlight = 2,
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
