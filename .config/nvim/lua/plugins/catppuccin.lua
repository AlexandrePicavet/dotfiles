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
		show_end_of_buffer = true,
		dim_inactive = {
			enabled = false,
			share = "dark",
			percentage = 0.15,
		},
		default_integration = true,
		integrations = {
			blink_cmp = true
		},
	},
	config = true,
}
