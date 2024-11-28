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
	config = true,
	commander = {
			{
				desc = "Toggle file tree (Left)",
				cmd = "<CMD>Neotree filesystem toggle left<CR>",
				keys = { "n", "<LEADER><C-e>", { noremap = true } },
			},
		}
}
