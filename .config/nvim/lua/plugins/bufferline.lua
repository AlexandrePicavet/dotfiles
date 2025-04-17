return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "BufEnter",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
		},
	},
	config = true,
	commander = {
		{
			desc = "Previous buffer",
			cmd = "<CMD>BufferLineCyclePrev<CR>",
			keys = { "n", "<LEADER>bh", { noremap = true } },
		},
		{
			desc = "Move buffer to previous",
			cmd = "<CMD>BufferLineMovePrev<CR>",
			keys = { "n", "<LEADER>bH", { noremap = true } },
		},
		{
			desc = "Next buffer",
			cmd = "<CMD>BufferLineCycleNext<CR>",
			keys = { "n", "<LEADER>bl", { noremap = true } },
		},
		{
			desc = "Move buffer to next",
			cmd = "<CMD>BufferLineCycleNext<CR>",
			keys = { "n", "<LEADER>bL", { noremap = true } },
		},
		{
			desc = "Close buffer",
			cmd = "<CMD>bd<CR>",
			keys = { "n", "<LEADER>bc", { noremap = true } },
		},
		{
			desc = "Close Buffer ignore changes",
			cmd = "<CMD>bd!<CR>",
			keys = { "n", "<LEADER>bC", { noremap = true } },
		},
		{
			desc = "Pin buffer",
			cmd = "<CMD>BufferLineTogglePin<CR>",
			keys = { "n", "<LEADER>bp", { noremap = true } },
		},
	},
}
