return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader><C-e>", mode = "n", "<cmd>Neotree filesystem toggle left<cr>", desc = "Toggle Neotree" },
	},
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
		},
		use_libuv_file_watcher = false,
	},
}
