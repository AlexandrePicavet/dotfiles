-- Requires the tree-sitter cli to be installed

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = function(_, opts)
		opts = vim.tbl_deep_extend("force", opts or {}, {
			highlight = { enable = true },
			incremental_selection = { enable = true },
			indent = { enable = false },
		})

		opts.ensure_installed = opts.ensure_installed or {}
		vim.list_extend(opts.ensure_installed, {
			"csv",
			"dart",
			"diff",
			"dockerfile",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"go",
			"gpg",
			"helm",
			"hyprlang",
			"jq",
			"nginx",
			"proto", -- protobuf
			"python",
			"regex",
			"rust",
			"sql",
			"ssh_config",
			"templ", -- Go templ
			"tmux",
			"toml",
			"yaml",
		})

		return opts
	end,
	config = function(_, opts)
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)

		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldlevelstart = 99 -- Open all folds by default when editing a buffer
	end,
}
