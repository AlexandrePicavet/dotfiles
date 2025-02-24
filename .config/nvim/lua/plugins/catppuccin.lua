return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
	opts = {
		flavour = "macchiato",
		background = {
			light = "latte",
			dark = "macchiato",
		},
		transparent_background = true,
		dim_inactive = {
			enabled = true,
			share = "dark",
			percentage = 0.15,
		},
		default_integration = true,
		integrations = {
			barbar = true,
			barbecue = {
				dim_dirname = true,
				bold_basename = true,
				dim_context = true,
				alt_background = false,
			},
			blink_cmp = true
		},
	},
	config = true,
}
