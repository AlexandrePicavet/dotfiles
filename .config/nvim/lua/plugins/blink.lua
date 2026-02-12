return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
		"L3MON4D3/LuaSnip",
		"fang2hou/blink-copilot",
		{
			"alexandre-abrioux/blink-cmp-npm.nvim",
			ft = "json",
		},
		"moyiz/blink-emoji.nvim",
		{
			"mikavilpas/blink-ripgrep.nvim",
			version = "*",
		},
		{ "xzbdmw/colorful-menu.nvim", config = true },
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
			menu = {
				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				"score",
				"sort_text",
				"label",
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
				return require("luasnip").in_snippet() or false
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
		sources = {
			default = { "npm", "lazydev", "lsp", "copilot", "path", "snippets", "emoji", "buffer", "ripgrep" },
			per_filetype = {
				codecompanion = { "codecompanion" },
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 300,
				},
				npm = {
					name = "npm",
					module = "blink-cmp-npm",
					async = true,
					score_offset = 300,
				},
				lsp = {
					score_offset = 200,
				},
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 150,
					async = true,
				},
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 100,
				},
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					---@module "blink-ripgrep"
					---@type blink-ripgrep.Options
					opts = {
						backend = {
							use = "gitgrep-or-ripgrep",
						},
					},
					score_offset = 0,
				},
			},
		},
		signature = {
			enabled = true,
		},
	},
	opts_extend = { "sources.default" },
}
