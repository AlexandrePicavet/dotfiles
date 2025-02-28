return {
	{
		"L3MON4D3/luaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function(_, _)
			require("luasnip.loaders.from_lua").load({ paths = { "./snippets" } })
			require("luasnip.loaders.from_vscode").load({})

			local ls = require("luasnip")
			require("commander").add({
				{
					desc = "Change snippet choice",
					cmd = function()
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
		dependencies = {
			"rafamadriz/friendly-snippets",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},
		version = "*",
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
