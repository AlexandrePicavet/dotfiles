return {
	"tomasky/bookmarks.nvim",
	opts = {
		save_file = vim.fn.expand("$HOME/.nvim_bookmarks"),
		keywords = {
			["@t"] = "󰄲 ",
			["@w"] = " ",
			["@f"] = "󰢷 ",
			["@n"] = "󰎞 ",
		},
		on_attach = function()
			local bm = require("bookmarks")
			require("commander").add({
				{
					desc = "Toggle bookmark",
					cmd = bm.bookmark_toggle,
					keys = { "n", "<LEADER>mm", { noremap = true } },
				},
				{
					desc = "Add or edit bookmark",
					cmd = bm.bookmark_ann,
					keys = { "n", "<LEADER>mi", { noremap = true } },
				},
				{
					desc = "Remove all bookmarks from current buffer",
					cmd = bm.bookmark_clean,
					keys = { "n", "<LEADER>mc", { noremap = true } },
				},
				{
					desc = "Go to next bookmark",
					cmd = bm.bookmark_next,
					keys = { "n", "<LEADER>mn", { noremap = true } },
				},
				{
					desc = "Go to previous bookmark",
					cmd = bm.bookmark_prev,
					keys = { "n", "<LEADER>mp", { noremap = true } },
				},
				{
					desc = "Remove all bookmarks",
					cmd = bm.bookmark_clear_all,
					keys = { "n", "<LEADER>mx", { noremap = true } },
				},
				{
					desc = "List bookmarks",
					cmd = "<CMD>Telescope bookmarks list<CR>",
					keys = { "n", "<LEADER>ml", { noremap = true } },
				},
			})
		end,
	},
}
