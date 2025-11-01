return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"lua",
				"luadoc",
			})

			return opts
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "lua_ls")
			vim.list_extend(opts.ensure_installed, {
				"lua_ls",
				"stylua"
			})

			return opts
		end,
	},
}
