return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "dart")

			return opts
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, require("null-ls").builtins.formatting.dart_format)

			return opts
		end,
	},
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim", "L3MON4D3/luaSnip" },
		opts = {
			lsp = {
				settings = {
					enableSnippets = true,
				},
			},
		},
		config = function(_, opts)
			require("luasnip").filetype_extend("dart", { "flutter" })

			require("flutter-tools").setup(opts)
		end,
	},
}
