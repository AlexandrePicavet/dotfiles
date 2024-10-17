return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"jdtls",
				"cucumber_language_server",
				"rust_analyzer",
				"html",
				"cssls",
				"css_variables",
				"somesass_ls",
				"ts_ls",
				"angularls",
				"eslint",
				"ast_grep",
				"nil_ls",
				"bashls",
				"hyprls",
			},
		},
		config = true,
	},
	{ "mfussenegger/nvim-jdtls" },
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.cucumber_language_server.setup({
				cmd = { "cucumber-language-server", "--stdio" },
				filetypes = { "cucumber", "feature" },
				root_dir = require("lspconfig").util.find_git_ancestor,
				settings = {},
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {},
				},
			})

			lspconfig.nil_ls.setup({})

			lspconfig.bashls.setup({
				filetypes = { "sh", "zsh" },
			})

			lspconfig.hyprls.setup({})

			local cssCapabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			lspconfig.css_variables.setup({})
			lspconfig.cssls.setup({ capabilities = cssCapabilities })
			lspconfig.somesass_ls.setup({})

			lspconfig.ts_ls.setup({})
			lspconfig.angularls.setup({})

			require("commander").add({
				{
					desc = "Go to declaration",
					cmd = vim.lsp.buf.declaration,
					keys = { "n", "<leader>gd", { noremap = true } },
				},
				{
					desc = "Go to definition",
					cmd = vim.lsp.buf.definition,
					keys = { "n", "<leader>gD", { noremap = true } },
				},
				{
					desc = "Go to type definition",
					cmd = vim.lsp.buf.type_definition,
					keys = { "n", "<leader>gt", { noremap = true } },
				},
				{
					desc = "Go to implementation",
					cmd = vim.lsp.buf.implementation,
					keys = { "n", "<leader>gi", { noremap = true } },
				},
				{
					desc = "Find references / usage",
					cmd = function()
						require("telescope.builtin").lsp_references()
					end,
					keys = {
						{ "n", "<leader>fr", { noremap = true } },
						{ "n", "<leader>fu", { noremap = true } },
					},
				},
				{
					desc = "Rename",
					cmd = vim.lsp.buf.rename,
					keys = { "n", "<leader>rn", { noremap = true } },
				},
				{
					desc = "List code actions",
					cmd = vim.lsp.buf.code_action,
					keys = { "n", "<leader>ca", { noremap = true } },
				},
				{
					desc = "List document diagnostics",
					cmd = "<Cmd>Telescope diagnostics bufnr=0<CR>",
					keys = { "n", "<leader>ldd", { noremap = true } },
				},
				{
					desc = "List workspace diagnostics",
					cmd = "<Cmd>Telescope diagnostics<CR>",
					keys = { "n", "<leader>ldw", { noremap = true } },
				},
				--[[{
					desc = "Show line diagnostics",
					cmd = vim.diagnostic.open_float,
					keys = { "n", "<leader>lds", { noremap = true } },
				}]]
				--,
			})
		end,
	},
}
