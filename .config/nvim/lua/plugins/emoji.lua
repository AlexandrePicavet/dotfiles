return {
	"xiyaowong/telescope-emoji.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").load_extension("emoji")

		require("commander").add({
			{
				desc = "Insert emoji",
				cmd = "<Cmd>Telescope emoji<CR>",
				keys = { "n", "<leader>pe", { noremap = true } },
			},
		})
	end,
}
