return {
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			opts = vim.tbl_deep_extend("force", opts or {}, {
				debug = false,
			})

			opts.sources = opts.sources or {}

			return opts
		end,
		config = true,
		keys = {
			{
				"<C-f>",
				mode = { "i", "n", "v" },
				vim.lsp.buf.format,
				desc = "Format File",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = function(_, opts)
			opts = vim.tbl_deep_extend("force", opts or {}, {
				automatic_installation = true,
			})

			opts.ensure_installed = opts.ensure_installed or {}

			return opts
		end,
		config = true,
	},
}
