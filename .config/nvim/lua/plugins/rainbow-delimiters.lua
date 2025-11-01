return {
	"HiPhish/rainbow-delimiters.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = require("rainbow-delimiters").strategy["global"],
			},
			query = {
				[""] = "rainbow-delimiters",
			},
			highlight = require('config.rainbow-highlight'),
		}
	end,
}
