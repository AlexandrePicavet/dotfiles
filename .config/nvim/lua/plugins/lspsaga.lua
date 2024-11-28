return {
	"nvimdev/lspsaga.nvim",
	after = "nvim-lspconfig",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		lightbulb = {
			enable = false,
		},
	},
	config = true,
	commander = {
			{
				desc = "Peek definition",
				cmd = "<CMD>Lspsaga peek_definition<CR>",
				keys = { "n", "<LEADER>pD", { noremap = true } },
			},
			{
				desc = "List incoming calls",
				cmd = "<CMD>Lspsaga incoming_calls<CR>",
				keys = { "n", "<LEADER>lic", { noremap = true } },
			},
			{
				desc = "List outgoing calls",
				cmd = "<CMD>Lspsaga outgoing_calls<CR>",
				keys = { "n", "<LEADER>loc", { noremap = true } },
			},
		}
}
