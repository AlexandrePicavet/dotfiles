return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000, -- Very high, cappuccin should run right after luarocks is installed.
	init = function()
		vim.diagnostic.config({
			signs = {
				linehl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticErrorLn",
					[vim.diagnostic.severity.WARN] = "DiagnosticWarnLn",
					[vim.diagnostic.severity.INFO] = "DiagnosticInfoLn",
					[vim.diagnostic.severity.HINT] = "DiagnosticHintLn",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
	---@type CatppuccinOptions
	opts = {
		flavour = "macchiato",
		background = {
			light = "latte",
			dark = "macchiato",
		},
		show_end_of_buffer = true,
		dim_inactive = { enabled = true },
		auto_integrations = true,
		custom_highlights = function(colors)
			local utils = require("catppuccin.utils.colors")

			return {
				DiagnosticErrorLn = {
					bg = utils.blend(colors.red, colors.crust, 0.125),
				},
				DiagnosticWarnLn = {
					bg = utils.blend(colors.yellow, colors.crust, 0.125),
				},
				DiagnosticInfoLn = {
					bg = utils.blend(colors.green, colors.crust, 0.25),
				},
				DiagnosticHintLn = {
					bg = utils.blend(colors.blue, colors.crust, 0.25),
				},
				BlinkCmpMenuSelection = {
					bg = colors.blue,
					fg = colors.crust
				},
				RainbowGreen = { fg = colors.green },
				RainbowTeal = { fg = colors.teal },
				RainbowBlue = { fg = colors.blue },
				RainbowRosewater = { fg = colors.rosewater },
				RainbowYellow = { fg = colors.yellow },
				RainbowPeach = { fg = colors.peach },
				RainbowPink = { fg = colors.pink },
				RainbowMaroon = { fg = colors.maroon },
				RainbowRed = { fg = colors.red },
				RainbowMauve = { fg = colors.mauve },
			}
		end,
	},
}
