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
				"exact",
				"score",
				"sort_text",
				"label",
			},
		},
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lsp", "snippets", "copilot", "path", "emoji", "buffer", "ripgrep" },
			per_filetype = {
				codecompanion = { "codecompanion" },
				lua = { inherit_defaults = true, "lazydev" },
				vim = { inherit_defaults = true, "cmdline" },
				json = { inherit_defaults = true, "npm" },
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
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					async = true,
					score_offset = -1000,
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
				},
			},
		},
		signature = {
			enabled = true,
		},
	},
	opts_extend = { "sources.default" },
}
