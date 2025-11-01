return {
  "rmagatti/goto-preview",
  dependencies = { "rmagatti/logger.nvim" },
  event = "BufEnter",
  opts = {
		width = 140,
		height = 40,
		default_mappings = true,
	}
}
