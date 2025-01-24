return {
	{
		"williamboman/mason.nvim",
		opts = {
			-- Custom option
			ensure_installed = {},
		},
		config = function(_, opts)
			local mason = require("mason")
			mason.setup({})

			local registry = require("mason-registry")
			local installed_packages = registry.get_installed_package_names()

			for _, check_installed in ipairs(opts.ensure_installed) do
				local is_installed = false
				for _, installed_package in ipairs(installed_packages) do
					if check_installed == installed_package then
						is_installed = true
						break
					end
				end

				if is_installed == false then
					registry.get_package(check_installed):install()
				end
			end

			registry
				:on(
					"package:install:handle",
					vim.schedule_wrap(function(pkg)
						print(string.format("Installing %s", pkg.name))
					end)
				)
				:on(
					"package:install:success",
					vim.schedule_wrap(function(pkg)
						print(string.format("Successfully installed %s", pkg.name))
					end)
				)
				:on(
					"package:install:failed",
					vim.schedule_wrap(function(pkg)
						print(string.format("Failed to install %s", pkg.name))
					end)
				)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"jdtls",
				"kotlin_language_server",
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
				"sqls",
				"astro",
			},
		},
		config = true,
	},
	{ "mfussenegger/nvim-jdtls" },
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.cucumber_language_server.setup({
				cmd = { "cucumber-language-server", "--stdio" },
				filetypes = { "cucumber", "feature" },
				root_dir = function(fname)
					return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
				end,
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
			lspconfig.sqls.setup({})
			lspconfig.kotlin_language_server.setup({})
			lspconfig.astro.setup({
				init_options = {
					typescript = {
						tsdk = vim.fn.expand(
							"~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib/"
						),
					},
				},
			})
		end,
		commander = {
			{
				desc = "Go to declaration",
				cmd = vim.lsp.buf.declaration,
				keys = { "n", "<LEADER>gd", { noremap = true } },
			},
			{
				desc = "Go to definition",
				cmd = vim.lsp.buf.definition,
				keys = { "n", "<LEADER>gD", { noremap = true } },
			},
			{
				desc = "Go to type definition",
				cmd = function()
					require("telescope.builtin").lsp_type_definitions()
				end,
				keys = { "n", "<LEADER>gt", { noremap = true } },
			},
			{
				desc = "Find implementations",
				cmd = function()
					require("telescope.builtin").lsp_implementations()
				end,
				keys = {
					{ "n", "<LEADER>fi", { noremap = true } },
				},
			},
			{
				desc = "Find references / usage",
				cmd = function()
					require("telescope.builtin").lsp_references()
				end,
				keys = {
					{ "n", "<LEADER>fr", { noremap = true } },
					{ "n", "<LEADER>fu", { noremap = true } },
				},
			},
			{
				desc = "Rename",
				cmd = vim.lsp.buf.rename,
				keys = { "n", "<LEADER>rn", { noremap = true } },
			},
			{
				desc = "List code actions",
				cmd = vim.lsp.buf.code_action,
				keys = { "n", "<LEADER>ca", { noremap = true } },
			},
			{
				desc = "List document diagnostics",
				cmd = "<CMD>Telescope diagnostics bufnr=0<CR>",
				keys = { "n", "<LEADER>ldd", { noremap = true } },
			},
			{
				desc = "List workspace diagnostics",
				cmd = "<CMD>Telescope diagnostics<CR>",
				keys = { "n", "<LEADER>ldw", { noremap = true } },
			},
		},
	},
}
