return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
		},
		use_libuv_file_watcher = true,
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		require("commander").add({
			{
				desc = "Toggle file tree (Left)",
				cmd = "<Cmd>Neotree filesystem toggle left<CR>",
				keys = { "n", "<leader><C-e>", { noremap = true } },
			},
		})
	end,
}
