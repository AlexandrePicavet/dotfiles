return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		commander = {
			{
				desc = "Git add all",
				cmd = "<CMD>Git add -A<CR>",
				keys = { "n", "<LEADER>Ga", { noremap = true } },
			},
			{
				desc = "Git commit",
				cmd = "<CMD>Git commit<CR>",
				keys = { "n", "<LEADER>Gc" },
			},
			{
				desc = "Git commit ammend",
				cmd = "<CMD>Git commit --amend<CR>",
				keys = { "n", "<LEADER>Gca" },
			},
			{
				desc = "Git commit ammend no edit",
				cmd = "<CMD>Git commit --amend --no-edit<CR>",
				keys = { "n", "<LEADER>Gcane", { noremap = true } },
			},
			{
				desc = "Git diff",
				cmd = "<CMD>Git diff<CR>",
				keys = { "n", "<LEADER>Gd" },
			},
			{
				desc = "Git diff HEAD",
				cmd = "<CMD>Git diff HEAD<CR>",
				keys = { "n", "<LEADER>Gdh", { noremap = true } },
			},
			{
				desc = "Diffget LOCAL",
				cmd = "<CMD>diffget LO<CR>",
				keys = { "n", "<LEADER>Gdgl", { noremap = true } },
			},
			{
				desc = "Diffget REMOTE",
				cmd = "<CMD>diffget RE<CR>",
				keys = { "n", "<LEADER>Gdgr", { noremap = true } },
			},
			{
				desc = "Git fetch",
				cmd = "<CMD>Git fetch<CR>",
				keys = { "n", "<LEADER>Gf" },
			},
			{
				desc = "Git fetch rebase",
				cmd = "<CMD>Git fetch<CR><CMD>Git rebase<CR>",
				keys = { "n", "<LEADER>Gfr", { noremap = true } },
			},
			{
				desc = "Git log",
				cmd = "<CMD>Git log<CR>",
				keys = { "n", "<LEADER>Gl", { noremap = true } },
			},
			{
				desc = "Git status",
				cmd = "<CMD>Git status<CR>",
				keys = { "n", "<LEADER>Gs", { noremap = true } },
			},
			{
				desc = "Git add updated",
				cmd = "<CMD>Git add -u<CR>",
				keys = { "n", "<LEADER>Gu", { noremap = true } },
			},
			{
				desc = "Git push",
				cmd = "<CMD>Git push<CR>",
				keys = { "n", "<LEADER>Gp" },
			},
			{
				desc = "Git push force",
				cmd = "<CMD>Git push --force-with-lease<CR>",
				keys = { "n", "<LEADER>Gpf", { noremap = true } },
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
		commander = {
			{
				desc = "Git diff show",
				cmd = "<CMD>Gitsigns preview_hunk_inline<CR>",
				keys = { "n", "<LEADER>Gds", { noremap = true } },
			},
			{
				desc = "Git diff next",
				cmd = "<CMD>Gitsigns nav_hunk next",
				keys = { "n", "<LEADER>Gdn", { noremap = true } },
			},
			{
				desc = "Git diff previous",
				cmd = "<CMD>Gitsigns nav_hunk previous",
				keys = { "n", "<LEADER>Gdp", { noremap = true } },
			},
			{
				desc = "Git toggle line blame",
				cmd = "<CMD>Gitsigns toggle_current_line_blame<CR>",
				keys = { "n", "<LEADER>Glb", { noremap = true } },
			},
		},
	},
}
