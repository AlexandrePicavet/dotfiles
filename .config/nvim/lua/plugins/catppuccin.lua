return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("catppuccin")

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
	end,
	---@type CatppuccinOptions
	opts = {
		flavour = "macchiato",
		background = {
			light = "latte",
			dark = "macchiato",
		},
		transparent_background = true,
		show_end_of_buffer = true,
		dim_inactive = {
			enabled = false,
			share = "dark",
			percentage = 0.15,
		},
		default_integration = true,
		integrations = {
			blink_cmp = true,
			notify = true,
		},
		custom_highlights = function(colors)
			return {
				DiagnosticErrorLn = { bg = colors.red, fg = colors.crust },
				DiagnosticWarnLn = { bg = colors.yellow, fg = colors.crust },
				DiagnosticInfoLn = { bg = colors.green, fg = colors.crust },
				DiagnosticHintLn = { bg = colors.blue, fg = colors.crust },
			}
		end,
	},
	config = true,
}
