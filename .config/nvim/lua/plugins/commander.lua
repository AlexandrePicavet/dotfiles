return {
	"FeiyouG/commander.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<C-p>", "<Cmd>Telescope commander<CR>" },
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
			},
			lazy = {
				enable = true,
				set_plugin_name_as_cat = true,
			},
		},
	},
	config = function(_, opts)
		opts["integration"]["telescope"]["theme"] = require("telescope.themes").commander

		local commander = require("commander")
		commander.setup(opts)
	end,
}
