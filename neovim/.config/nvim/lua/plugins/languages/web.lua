return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"angular",
				"astro",
				"css",
				"html",
				"javascript",
				"jsdoc",
				"json5",
				"jsonc",
				"robots", -- robots.txt
				"scss",
				"svelte",
				"tsx",
				"typescript",
			})

			return opts
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "js-debug-adapter")

			return opts
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"angularls",
				"astro",
				"cssls",
				"css_variables",
				"denols",
				"eslint",
				"html",
				"svelte",
				"ts_ls",
			})

			opts.automatic_enable = opts.automatic_enable or {}
			opts.automatic_enable.exclude = opts.automatic_enable.exclude or {}
			table.insert(opts.automatic_enable.exclude, "denols")

			return opts
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "prettier")

			return opts
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, require("null-ls").builtins.formatting.prettier)

			return opts
		end,
	},
}
