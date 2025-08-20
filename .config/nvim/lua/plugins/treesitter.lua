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
			"hyprlang",
			"sql",
			"yuck",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		vim.filetype.add({
			extension = { rasi = "rasi" },
			pattern = {
				[".*/kitty/*.conf"] = "bash",
				[".*/hypr/.*%.conf"] = "hyprlang",
			},
		})

		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)

		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldlevelstart = 99
	end,
}
