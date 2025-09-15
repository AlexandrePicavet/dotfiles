return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		opts = function()
			local null_ls = require("null-ls")

			local formatting = null_ls.builtins.formatting

			local function has_eslint_config(params)
				-- https://eslint.org/docs/latest/use/configure/configuration-files#configuration-file
				return params.root_has_file({
					"eslint.config.cjs",
					"eslint.config.js",
					"eslint.config.mjs",
					"eslint.config.cts",
					"eslint.config.ts",
					"eslint.config.mts",
				})
			end

			return {
				debug = true,
				sources = {
					formatting.stylua,
					formatting.prettier,
					formatting.nixpkgs_fmt,
					formatting.shfmt,
					require("none-ls.diagnostics.eslint_d").with({ condition = has_eslint_config }),
					require("none-ls.formatting.eslint_d").with({ condition = has_eslint_config }),
					require("none-ls.code_actions.eslint_d").with({ condition = has_eslint_config }),
				},
			}
		end,
		config = true,
		commander = {
			{
				desc = "Format File",
				cmd = vim.lsp.buf.format,
				keys = { { "n", "v" }, "<LEADER>ff", { noremap = true } },
			},
		},
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
				"shellcheck",
				"shfmt",
			},
		},
		config = true,
	},
}
