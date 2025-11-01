return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		{
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
		},
	},
	init = function()
		require("telescope").load_extension("noice")
	end,
	opts = {
		messages = {
			view_search = "mini",
		},
	},
}
