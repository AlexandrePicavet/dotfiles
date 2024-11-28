return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("lsp_lines").setup()

		vim.diagnostic.config({ virtual_text = false })
	end,
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
