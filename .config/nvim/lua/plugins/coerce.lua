return {
	"gregorias/coerce.nvim",
	tag = "v4.1.0",
	opts = function()
		return {
			default_mode_keymap_prefixes = {
				normal_mode = "<LEADER>rc",
				motion_mode = "<LEADER>rc",
				visual_mode = "<LEADER>rc",
			},
			default_mode_mask = {
				normal_mode = true,
				motion_mode = true,
				visual_mode = true,
			},
		}
	end,
	config = true,
}
