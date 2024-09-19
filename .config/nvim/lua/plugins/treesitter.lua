return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"csv",
			"diff",
			"dockerfile",
			"git_config",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"java",
			"jq",
			"java",
			"json",
			"json5",
			"jsonc",
			"lua",
			"tmux",
			"toml",
			"vim",
			"xml",
			"yaml",
			"nix",
			"html",
			"javascript",
			"typescript",
			"svelte",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
}
