return {
	{
		"tpope/vim-fugitive",
		config = function()
			require("commander").add({
				{
					desc = "Git add all",
					cmd = "<CMD>Git add -A<CR>",
					keys = { "n", "<leader>ga", { noremap = true } },
				},
				{
					desc = "Git commit",
					cmd = "<CMD>Git commit<CR>",
					keys = { "n", "<leader>gc" },
				},
				{
					desc = "Git commit ammend",
					cmd = "<CMD>Git commit --amend<CR>",
					keys = { "n", "<leader>gca" },
				},
				{
					desc = "Git commit ammend no edit",
					cmd = "<CMD>Git commit --amend --no-edit<CR>",
					keys = { "n", "<leader>gcane", { noremap = true } },
				},
				{
					desc = "Git diff",
					cmd = "<CMD>Git diff<CR>",
					keys = { "n", "<leader>gd" },
				},
				{
					desc = "Git diff",
					cmd = "<CMD>Git diff HEAD<CR>",
					keys = { "n", "<leader>gdh", { noremap = true } },
				},
				{
					desc = "Git fetch",
					cmd = "<CMD>Git fetch<CR>",
					keys = { "n", "<leader>gf" },
				},
				{
					desc = "Git fetch rebase",
					cmd = "<CMD>Git fetch<CR><CMD>Git rebase<CR>",
					keys = { "n", "<leader>gfr", { noremap = true } },
				},
				{
					desc = "Git log",
					cmd = "<CMD>Git log<CR>",
					keys = { "n", "<leader>gl", { noremap = true } },
				},
				{
					desc = "Git status",
					cmd = "<CMD>Git status<CR>",
					keys = { "n", "<leader>gs", { noremap = true } },
				},
				{
					desc = "Git add updated",
					cmd = "<CMD>Git add -u<CR>",
					keys = { "n", "<leader>gu", { noremap = true } },
				},
				{
					desc = "Git push",
					cmd = "<CMD>Git push<CR>",
					keys = { "n", "<leader>gp" },
				},
				{
					desc = "Git push force",
					cmd = "<CMD>Git push --force-with-lease<CR>",
					keys = { "n", "<leader>gpf", { noremap = true } },
				},
				{
					desc = "Git show",
					cmd = "<CMD>Git show<CR>",
					keys = { "n", "<leader>gpf", { noremap = true } },
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup()

			require("commander").add({
				{
					desc = "Git diff show",
					cmd = "<CMD>Gitsigns preview_hunk_inline<CR>",
					keys = { "n", "<leader>gds", { noremap = true } },
				},
				{
					desc = "Git diff next",
					cmd = function()
						gitsigns.nav_hunk("next")
					end,
					keys = { "n", "<leader>gdn", { noremap = true } },
				},
				{
					desc = "Git diff previous",
					cmd = function()
						gitsigns.nav_hunk("previous")
					end,
					keys = { "n", "<leader>gdp", { noremap = true } },
				},
				{
					desc = "Git toggle line blame",
					cmd = "<Cmd>Gitsigns toggle_current_line_blame<CR>",
					keys = { "n", "<leader>glb", { noremap = true } },
				},
			})
		end,
	},
}
