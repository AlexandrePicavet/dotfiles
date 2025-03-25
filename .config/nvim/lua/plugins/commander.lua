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
		{
			desc = "Split vertical window",
			cmd = "<CMD>vsplit<CR>",
			keys = { "n", "<C-w>%", { noremap = true, silent = true } },
		},
		{
			desc = "Split horizontal window",
			cmd = "<CMD>split<CR>",
			keys = { "n", '<C-w>"', { noremap = true, silent = true } },
		},
		{
			desc = "Split vertical terminal",
			cmd = "<CMD>vsplit term://zsh<CR>",
			keys = { "n", "<C-w>t%", { noremap = true, silent = true } },
		},
		{
			desc = "Split horizontal terminal",
			cmd = "<CMD>split term://zsh<CR>",
			keys = { "n", '<C-w>t"', { noremap = true, silent = true } },
		},
		{
			desc = "Copy filepath to clipboard",
			cmd = function()
				local filepath = vim.fn.expand("%")
				vim.fn.setreg("+", filepath)
				print("Filepath copied to clipboard: " .. filepath)
			end,
			keys = { "n", "<leader>fp", { noremap = true } },
		},
		{
			desc = "Quickfix open",
			cmd = "<CMD>copen<CR>",
			keys = { "n", "<LEADER>co", { noremap = true, silent = true } },
		},
		{
			desc = "Quickfix next",
			cmd = "<CMD>cnext<CR>",
			keys = { "n", "<LEADER>cn", { noremap = true, silent = true } },
		},
		{
			desc = "Quickfix previous",
			cmd = "<CMD>cprevious<CR>",
			keys = { "n", "<LEADER>cp", { noremap = true, silent = true } },
		},
		{
			desc = "Quickfix close",
			cmd = "<CMD>cclose<CR>",
			keys = { "n", "<LEADER>cc", { noremap = true, silent = true } },
		},
		{
			desc = "Quit terminal mode",
			cmd = [[<C-\><C-n>]],
			keys = { "t", "<C-Space>", { noremap = true, silent = true } },
		},
		{
			desc = "Disable F1 key",
			cmd = "<NOP>",
			keys = { { "n", "i" }, "<F1>", { noremap = true, silent = true } },
		},
	},
}
