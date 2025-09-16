return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 999,
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
			local success, Color = pcall(function()
				return require("lua-color")
			end)

			if success == false then
				require("notify")("lua-color not installed.", vim.log.levels.WARN)
				return {}
			end

			local crust_color = Color(colors.crust)

			return {
				DiagnosticErrorLn = {
					bg = Color(crust_color):mix(Color(colors.red), 0.125):tostring(),
				},
				DiagnosticWarnLn = {
					bg = Color(crust_color):mix(Color(colors.yellow), 0.125):tostring(),
				},
				DiagnosticInfoLn = {
					bg = Color(crust_color):mix(Color(colors.green), 0.25):tostring(),
				},
				DiagnosticHintLn = {
					bg = Color(crust_color):mix(Color(colors.blue), 0.25):tostring(),
				},
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)

		vim.cmd.colorscheme("catppuccin")
	end,
}
