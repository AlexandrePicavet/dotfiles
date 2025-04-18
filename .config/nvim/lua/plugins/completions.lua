return {
	{
		"L3MON4D3/luaSnip",
		lazy = true,
		version = "v2.*",
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
					require("luasnip.loaders.from_vscode").lazy_load({})
				end,
			},
		},
		build = "make install_jsregexp",
		init = function()
			require("commander").add({
				{
					desc = "Change snippet choice",
					cmd = function()
						local ls = require("luasnip")
						if ls.choice_active() then
							ls.change_choice(1)
						end
					end,
					keys = { { "i", "s" }, "<C-c>", { noremap = true, silent = true } },
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},
		event = "VeryLazy",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				["<Up>"] = {},
				["<Down>"] = {},
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
				},
				ghost_text = {
					enabled = false,
				},
			},
			snippets = {
				preset = "luasnip",
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			signature = {
				enabled = true,
			},
		},
		opts_extend = { "sources.default" },
	},
}
