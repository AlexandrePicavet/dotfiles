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

			require("commander").add({
				{
					desc = "List commands",
					cmd = "<Cmd>Telescope commands<CR>",
					keys = { "n", "<leader>lc", { noremap = true } },
				},
				{
					desc = "List help tags",
					cmd = "<Cmd>Telescope help_tags<CR>",
					keys = { "n", "<leader>lh", { noremap = true } },
				},
				{
					desc = "List buffers",
					cmd = "<Cmd>Telescope buffers<CR>",
					keys = { "n", "<leader>pb", { noremap = true } },
				},
				{
					desc = "List registers",
					cmd = "<Cmd>Telescope registers<CR>",
					keys = { "n", "<leader>pr", { noremap = true } },
				},
				{
					desc = "Find in project",
					cmd = "<Cmd>Telescope live_grep<CR>",
					keys = { "n", "<leader>pg", { noremap = true } },
				},
				{
					desc = "Find file in project",
					cmd = "<Cmd>Telescope find_files<CR>",
					keys = { "n", "<leader>pf", { noremap = true } },
				},
			})
		end,
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
