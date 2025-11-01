return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	event = "VeryLazy",
	opts = {
		virtual_lines = true,
	},
	keys = {
		{
			"<LEADER>ld",
			function()
				require("lsp_lines").toggle()
			end,
			desc = "Toggle LSP Lines",
		},
	},
}
