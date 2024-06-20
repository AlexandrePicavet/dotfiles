return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		local lsp_lines = require("lsp_lines")
		lsp_lines.setup()
		vim.diagnostic.config({ virtual_text = false })

		require("commander").add({
			{
				desc = "Toggle LSP Lines",
				cmd = lsp_lines.toggle,
				keys = { "n", "<leader>lds", { noremap = true } },
			},
		})
	end,
}
