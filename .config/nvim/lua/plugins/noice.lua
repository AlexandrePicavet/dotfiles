return {
	"folke/noice.nvim",
	enabled = false,
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
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
