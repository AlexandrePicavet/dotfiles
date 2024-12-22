return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		theme = "hyper",
		disable_move = false,
		shortcut_type = "number",
		shuffle_letter = false,
		change_to_vcs_root = false,
		config = {
			disable_move = false,
			week_header = {
				enable = true,
			},
			shortcut = {
				{
					icon = " ",
					desc = "Search Files",
					group = "Label",
					action = "Telescope find_files",
					key = "f",
				},
				{
					icon = "󰺮 ",
					desc = "Search Text",
					group = "Label",
					action = "Telescope live_grep",
					key = "g",
				},
				{
					icon = "󰒲 ",
					desc = "Lazy",
					group = "@property",
					action = "Lazy",
					key = "l",
				},
				{
					icon = " ",
					desc = "Mason",
					group = "@property",
					action = "Mason",
					key = "m",
				},
				{
					icon = " ",
					desc = "Quit",
					group = "DashboardShortCut",
					action = "q",
					key = "q",
				},
			},
			packages = { enable = true },
			project = {
				enable = true,
				limit = 10,
				icon = " ",
				label = "Projects",
				action = function(path)
					vim.cmd("cd " .. path)
					vim.cmd("Neotree focus")
				end,
			},
			mru = {
				enable = true,
				limit = 30,
				icon = "󰈔 ",
				label = "Files",
				cwd_only = true,
			},
		},
		hide = {
			statusline = true,
			tabline = true,
			winbar = true,
		},
		preview = {
			file_path = true,
			file_height = true,
			file_width = true,
		},
	},
	config = true,
	commander = {
		{
			desc = "Project Dashboard",
			cmd = "<CMD>Dashboard<CR>",
			keys = { "n", "<LEADER>pd", { noremap = true } },
		},
	},
}
