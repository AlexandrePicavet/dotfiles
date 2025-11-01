return {
	"lewis6991/gitsigns.nvim",
	config = true,
	event = "VeryLazy",
	opts = {
		numhl = true,
		signcolumn = false,
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 250,
			ignore_whitespace = true,
		},
	},
}
