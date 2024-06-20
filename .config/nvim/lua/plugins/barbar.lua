return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>bh", "<Cmd>BufferPrevious<CR>" },
		{ "<leader>bH", "<Cmd>BufferMovePrevious<CR>" },
		{ "<leader>bl", "<Cmd>BufferNext<CR>" },
		{ "<leader>bL", "<Cmd>BufferMoveNext<CR>" },
		{ "<leader>bc", "<Cmd>BufferClose<CR>" },
		{ "<leader>br", "<Cmd>BufferRestore<CR>" },
		{ "<leader>bp", "<Cmd>BufferPin<CR>" },
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function(_, args)
		require("barbar").setup(args)
	end,
}
