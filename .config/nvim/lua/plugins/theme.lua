return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
	opts = {
		flavour = "auto",
		background = {
			light = "latte",
			dark = "macchiato",
		},
		transparent_background = false,
		dim_inactive = {
			enabled = true,
			share = "dark",
			percentage = 0.15,
		},
		default_integration = true,
		integrations = {
			barbar = true,
		},
	},
	config = true,
}
