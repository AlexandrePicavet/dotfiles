return {
	"rcarriga/nvim-notify",
	---@type notify.Config
	opts = {
		render = "wrapped-default",
		max_width = 75,
		max_height = 10,
		stages = "slide",
		merge_duplicates = true,
		background_colour = "#000000",
	},
	init = function()
		vim.notify = require("notify")
	end,
}
