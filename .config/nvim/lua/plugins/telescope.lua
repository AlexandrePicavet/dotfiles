return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
		},
		opts = {
			defaults = {
				path_display = {
					truncate = 1,
				},
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						width = 0.9,
						height = 0.9,
						prompt_position = "bottom",
						preview_width = 0.9,
						preview_height = 0.6,
					},
				},
			},
			extensions = {
				emoji = {
					action = function(emoji)
						vim.fn.setreg("*", emoji.value)
						vim.api.nvim_put({ emoji.value }, "c", false, true)
					end,
				},
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},
		config = function(_, opts)
			opts["extensions"]["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			}

			local telescope = require("telescope")
			telescope.setup(opts)

			telescope.load_extension("live_grep_args")
			telescope.load_extension("ui-select")
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
				desc = "Find in project extended",
				cmd = "<CMD>Telescope live_grep_args<CR>",
				keys = { "n", "<LEADER>pG", { noremap = true } },
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
			{
				desc = "Change buffer filetype",
				cmd = "<CMD>Telescope filetypes<CR>",
				keys = { "n", "<LEADER>bf", { noremap = true } },
			},
			{
				desc = "List buffer symbols",
				cmd = "<CMD>Telescope lsp_document_symbols<CR>",
				keys = { "n", "<LEADER>bs", { noremap = true } },
			},
		},
	},
}
