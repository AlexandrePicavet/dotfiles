return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			defaults = {
				path_display = {
					truncate = 1,
				},
			},
			extensions = {
				emoji = {
					action = function(emoji)
						vim.fn.setreg("*", emoji.value)
						vim.api.nvim_put({ emoji.value }, "c", false, true)
					end,
				},
			},
		},
		config = function(_, opts)
			opts["extensions"]["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			}
			require("telescope").setup(opts)
		end,
		commander = {
			{
				desc = "List commands",
				cmd = "<CMD>Telescope commands<CR>",
				keys = { "n", "<LEADER>lc", { noremap = true } },
			},
			{
				desc = "List help tags",
				cmd = "<CMD>Telescope help_tags<CR>",
				keys = { "n", "<LEADER>lh", { noremap = true } },
			},
			{
				desc = "List buffers",
				cmd = "<CMD>Telescope buffers<CR>",
				keys = { "n", "<LEADER>pb", { noremap = true } },
			},
			{
				desc = "List registers",
				cmd = "<CMD>Telescope registers<CR>",
				keys = { "n", "<LEADER>pr", { noremap = true } },
			},
			{
				desc = "Find in project",
				cmd = "<CMD>Telescope live_grep<CR>",
				keys = { "n", "<LEADER>pg", { noremap = true } },
			},
			{
				desc = "Find file in project",
				cmd = "<CMD>Telescope find_files<CR>",
				keys = { "n", "<LEADER>pf", { noremap = true } },
			},
			{
				desc = "Find file in project, including hidden",
				cmd = "<CMD>Telescope find_files hidden=true<CR>",
				keys = { "n", "<LEADER>pF", { noremap = true } },
			},
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
}
