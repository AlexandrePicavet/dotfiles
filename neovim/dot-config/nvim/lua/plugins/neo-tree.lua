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
				hide_gitignored = false,
				hide_ignored = false,
				ignore_files = { ".git" },
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
		},
		use_libuv_file_watcher = true,
		enable_git_status = false,
		enable_diagnostics = false,
	},
}
