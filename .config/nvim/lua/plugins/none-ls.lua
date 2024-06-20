return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.nixpkgs_fmt,
					null_ls.builtins.diagnostics.deadnix,
					null_ls.builtins.diagnostics.statix,
					null_ls.builtins.code_actions.statix,
					require("none-ls.diagnostics.eslint_d"),
					require("none-ls.formatting.eslint_d"),
					require("none-ls.code_actions.eslint_d"),
				},
			})

			require("commander").add({
				{
					desc = "Format File",
					cmd = vim.lsp.buf.format,
					keys = { "n", "<leader>ff", { noremap = true } },
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = {
			automatic_installation = true,
			ensure_installed = {
				"stylua",
				"prettier",
				"eslint_d",
				"nixpkgs-fmt",
			},
		},
		config = true,
	},
}
