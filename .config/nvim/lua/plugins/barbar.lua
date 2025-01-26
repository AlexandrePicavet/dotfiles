return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function(_, args)
		require("barbar").setup(args)
	end,
	commander = {
		{
			desc = "Previous buffer",
			cmd = "<CMD>BufferPrevious<CR>",
			keys = { "n", "<LEADER>bh", { noremap = true } },
		},
		{
			desc = "Move buffer to previous",
			cmd = "<CMD>BufferMovePrevious<CR>",
			keys = { "n", "<LEADER>bH", { noremap = true } },
		},
		{
			desc = "Next buffer",
			cmd = "<CMD>BufferNext<CR>",
			keys = { "n", "<LEADER>bl", { noremap = true } },
		},
		{
			desc = "Move buffer to next",
			cmd = "<CMD>BufferMoveNext<CR>",
			keys = { "n", "<LEADER>bL", { noremap = true } },
		},
		{
			desc = "Close buffer",
			cmd = "<CMD>BufferClose<CR>",
			keys = { "n", "<LEADER>bc", { noremap = true } },
		},
		{
			desc = "Close Buffer ignore changes",
			cmd = "<CMD>BufferClose!<CR>",
			keys = { "n", "<LEADER>bC", { noremap = true } },
		},
		{
			desc = "Restore buffer",
			cmd = "<CMD>BufferRestore<CR>",
			keys = { "n", "<LEADER>br", { noremap = true } },
		},
		{
			desc = "Pin buffer",
			cmd = "<CMD>BufferPin<CR>",
			keys = { "n", "<LEADER>bp", { noremap = true } },
		},
	},
}
