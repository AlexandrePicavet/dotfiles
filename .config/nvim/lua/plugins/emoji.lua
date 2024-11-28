return {
	"xiyaowong/telescope-emoji.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").load_extension("emoji")
	end,
	commander = {
		{
			desc = "Insert emoji",
			cmd = "<CMD>Telescope emoji<CR>",
			keys = { "n", "<LEADER>pe", { noremap = true } },
		},
	},
}
