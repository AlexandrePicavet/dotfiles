return {
	"olimorris/codecompanion.nvim",
	version = "^18.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
		"MeanderingProgrammer/render-markdown.nvim",
		"HakonHarnes/img-clip.nvim",
		"ravitemer/codecompanion-history.nvim",
	},
	opts = {
		extensions = {
			history = {
				enabled = true, -- defaults to true
				opts = {
					dir_to_save = vim.fn.stdpath("data") .. "/codecompanion_chats.json",
				},
			},
		},
	},
}
