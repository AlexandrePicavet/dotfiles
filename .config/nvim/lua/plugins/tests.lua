return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"thenbe/neotest-playwright",
		},
		opts = function()
			return {
				adapters = {
					require("neotest-playwright").adapter({
						options = {
							persist_project_selection = true,
							enable_dynamic_test_discovery = true,
						},
					}),
				},
				consumers = {
					playwright = require("neotest-playwright.consumers").consumers,
				},
			}
		end,
		commander = {
			{
				desc = "Tests - Summary",
				cmd = function()
					require("neotest").summary.toggle()
				end,
				keys = { "n", "<leader>ts", { noremap = true } },
			},
			{
				desc = "Tests - Run",
				cmd = function()
					require("neotest").run.run()
				end,
				keys = { "n", "<leader>tr", { noremap = true } },
			},
			{
				desc = "Tests - Stop",
				cmd = function()
					require("neotest").run.stop({interactive = true})
				end,
				keys = { "n", "<leader>tx", { noremap = true } },
			},
			{
				desc = "Tests - Watch",
				cmd = function()
					require("neotest").watch.watch()
				end,
				keys = { "n", "<leader>tw", { noremap = true } },
			},
			{
				desc = "Tests - Watch stop",
				cmd = function()
					require("neotest").watch.stop()
				end,
				keys = { "n", "<leader>tx", { noremap = true } },
			},
			{
				desc = "Tests - File run",
				cmd = function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				keys = { "n", "<leader>tfr", { noremap = true } },
			},
			{
				desc = "Tests - File watch",
				cmd = function()
					require("neotest").watch.watch(vim.fn.expand("%"))
				end,
				keys = { "n", "<leader>tfw", { noremap = true } },
			},
		},
	},
}
