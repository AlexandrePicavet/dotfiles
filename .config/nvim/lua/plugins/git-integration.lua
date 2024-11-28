return {
	{
		"tpope/vim-fugitive",
		commander = {
			{
				desc = "Git add all",
				cmd = "<CMD>Git add -A<CR>",
				keys = { "n", "<LEADER>ga", { noremap = true } },
			},
			{
				desc = "Git commit",
				cmd = "<CMD>Git commit<CR>",
				keys = { "n", "<LEADER>gc" },
			},
			{
				desc = "Git commit ammend",
				cmd = "<CMD>Git commit --amend<CR>",
				keys = { "n", "<LEADER>gca" },
			},
			{
				desc = "Git commit ammend no edit",
				cmd = "<CMD>Git commit --amend --no-edit<CR>",
				keys = { "n", "<LEADER>gcane", { noremap = true } },
			},
			{
				desc = "Git diff",
				cmd = "<CMD>Git diff<CR>",
				keys = { "n", "<LEADER>gd" },
			},
			{
				desc = "Git diff",
				cmd = "<CMD>Git diff HEAD<CR>",
				keys = { "n", "<LEADER>gdh", { noremap = true } },
			},
			{
				desc = "Git fetch",
				cmd = "<CMD>Git fetch<CR>",
				keys = { "n", "<LEADER>gf" },
			},
			{
				desc = "Git fetch rebase",
				cmd = "<CMD>Git fetch<CR><CMD>Git rebase<CR>",
				keys = { "n", "<LEADER>gfr", { noremap = true } },
			},
			{
				desc = "Git log",
				cmd = "<CMD>Git log<CR>",
				keys = { "n", "<LEADER>gl", { noremap = true } },
			},
			{
				desc = "Git status",
				cmd = "<CMD>Git status<CR>",
				keys = { "n", "<LEADER>gs", { noremap = true } },
			},
			{
				desc = "Git add updated",
				cmd = "<CMD>Git add -u<CR>",
				keys = { "n", "<LEADER>gu", { noremap = true } },
			},
			{
				desc = "Git push",
				cmd = "<CMD>Git push<CR>",
				keys = { "n", "<LEADER>gp" },
			},
			{
				desc = "Git push force",
				cmd = "<CMD>Git push --force-with-lease<CR>",
				keys = { "n", "<LEADER>gpf", { noremap = true } },
			},
			{
				desc = "Git show",
				cmd = "<CMD>Git show<CR>",
				keys = { "n", "<LEADER>gpf", { noremap = true } },
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
				keys = { "n", "<LEADER>gds", { noremap = true } },
			},
			{
				desc = "Git diff next",
				cmd = "<CMD>Gitsigns nav_hunk next",
				keys = { "n", "<LEADER>gdn", { noremap = true } },
			},
			{
				desc = "Git diff previous",
				cmd = "<CMD>Gitsigns nav_hunk previous",
				keys = { "n", "<LEADER>gdp", { noremap = true } },
			},
			{
				desc = "Git toggle line blame",
				cmd = "<CMD>Gitsigns toggle_current_line_blame<CR>",
				keys = { "n", "<LEADER>glb", { noremap = true } },
			},
		},
	},
}
