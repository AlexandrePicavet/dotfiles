return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"thenbe/neotest-playwright",
		"rcasia/neotest-java",
	},
	keys = function()
		local neotest = require("neotest")

		return {
			{
				"<leader>tfr",
				function()
					neotest.run.run(vim.fn.expand("%"))
				end,
				mode = "n",
				desc = "Tests - File run",
			},
			{
				"<leader>tfw",
				function()
					neotest.watch.watch(vim.fn.expand("%"))
				end,
				mode = "n",
				desc = "Tests - File watch",
			},
			{
				"<leader>ts",
				function()
					neotest.summary.toggle()
				end,
				mode = "n",
				desc = "Tests - Toggle summary",
			},
			{
				"<leader>tr",
				function()
					neotest.run.run()
				end,
				mode = "n",
				desc = "Tests - Run all",
			},
			{
				"<leader>tx",
				function()
					neotest.run.stop()
				end,
				mode = "n",
				desc = "Tests - Stop",
			},
			{
				"<leader>tw",
				function()
					neotest.watch.watch()
				end,
				mode = "n",
				desc = "Tests - Watch",
			},
			{
				"<leader>tX",
				function()
					neotest.watch.stop()
				end,
				mode = "n",
				desc = "Tests - Watch stop",
			},
		}
	end,
	-- TODO variabilize the tests like for the LSPs & Treesitters
	opts = function()
		return {
			adapters = {
				require("neotest-playwright").adapter({
					options = {
						persist_project_selection = true,
						enable_dynamic_test_discovery = true,
					},
				}),
				require("neotest-java")({
					junit_jar = nil,
					incremental_build = true,
					ignore_wrapper = true,
				}),
			},
			consumers = {
				playwright = require("neotest-playwright.consumers").consumers,
			},
			summary = {
				follow = true,
				count = true,
			},
		}
	end,
}
