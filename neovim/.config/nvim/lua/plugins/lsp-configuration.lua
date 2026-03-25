-- TODO enable fenced languages
-- https://www.benpickles.com/articles/88-vim-syntax-highlight-markdown-code-blocks
-- vim.g.markdown_fenced_languages = { "ts=typescript" }
return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
	},
	{
		"mason-org/mason.nvim",
		config = true,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = function(_, opts)
			opts = opts or {}
			opts.ensure_installed = opts.ensure_installed or {}

			vim.list_extend(opts.ensure_installed, {
				"kotlin_language_server",
				"sqls",
				"hyprls",
				"lemminx",
				"yamlls",
				"pylsp",
				"ruff",
				"gopls",
				"rust_analyzer",
			})

			return opts
		end,
	},
}
