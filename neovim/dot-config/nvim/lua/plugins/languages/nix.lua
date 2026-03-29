return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "nix")

			return opts
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "nil_ls")

			return opts
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "nixfmt")

			return opts
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, require("null-ls").builtins.formatting.nixfmt)

			return opts
		end,
	},
}
