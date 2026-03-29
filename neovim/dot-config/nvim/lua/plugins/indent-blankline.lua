return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = {
			highlight = require("config.rainbow-highlight"),
			-- can lead to weird behavior, see :h ibl.config.scope.include.node_type
			-- https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/lua/ibl/scope_languages.lua
			include = { node_type = { ["*"] = {"*"} } }
		},
	},
}
