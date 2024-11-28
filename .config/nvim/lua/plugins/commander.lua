return {
	"FeiyouG/commander.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		components = {
			"DESC",
			"KEYS",
			"CAT",
		},
		sort_by = {
			"DESC",
			"KEYS",
			"CAT",
			"CMD",
		},
		integration = {
			telescope = {
				enable = true,
				theme = require("telescope.themes").commander,
			},
			lazy = {
				enable = true,
				set_plugin_name_as_cat = true,
			},
		},
	},
	commander = {
		{
			desc = "List keymaps",
			cmd = "<CMD>Telescope commander<CR>",
			keys = { "n", "<C-p>", { noremap = true } },
		},
	},
}
