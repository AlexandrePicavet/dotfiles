return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = true,
	commander = {
		{
			desc = "Toggle LSP Lines",
			cmd = function()
				require("lsp_lines").toggle()
			end,
			keys = { "n", "<LEADER>lds", { noremap = true } },
		},
	},
}
