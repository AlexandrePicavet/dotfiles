return {
	"RRethy/vim-illuminate",
	opts = {
		providers = {
			"lsp",
			"treesitter",
		},
		delay = 0,
		under_cursor = false,
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
