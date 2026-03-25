return {
	"rcarriga/nvim-notify",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
	},
	keys = {
		{ "<leader>pn", mode = "n", "<cmd>Telescope notify<cr>", desc = "List notification history" },
	},
	opts = {
		render = "wrapped-default",
		max_width = 75,
		max_height = 10,
		stages = "slide",
		merge_duplicates = true,
		background_colour = "#000000",
		top_down = false,
	},
}
