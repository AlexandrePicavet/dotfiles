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
	config = function(_, opts)
		require("lspsaga").setup(opts)

		require("commander").add({
			{
				desc = "Peek definition",
				cmd = "<Cmd>Lspsaga peek_definition<CR>",
				keys = { "n", "<leader>pD", { noremap = true } },
			},
			{
				desc = "List incoming calls",
				cmd = "<Cmd>Lspsaga incoming_calls<CR>",
				keys = { "n", "<leader>lic", { noremap = true } },
			},
			{
				desc = "List outgoing calls",
				cmd = "<Cmd>Lspsaga outgoing_calls<CR>",
				keys = { "n", "<leader>loc", { noremap = true } },
			},
		})
	end,
}
