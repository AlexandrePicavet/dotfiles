return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	init = function()
		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = {
				highlight_whole_line = true,
			},
		})
	end,
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
