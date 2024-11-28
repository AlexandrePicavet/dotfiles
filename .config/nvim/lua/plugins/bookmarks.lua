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
	},
	commander = {
		{
			desc = "Toggle bookmark",
			cmd = function()
				require("bookmarks").bookmark_toggle()
			end,
			keys = { "n", "<LEADER>mt", { noremap = true } },
		},
		{
			desc = "Add or edit bookmark",
			cmd = function()
				require("bookmarks").bookmark_ann()
			end,
			keys = { "n", "<LEADER>mi", { noremap = true } },
		},
		{
			desc = "Remove all bookmarks from current buffer",
			cmd = function()
				require("bookmarks").bookmark_clean()
			end,
			keys = { "n", "<LEADER>mc", { noremap = true } },
		},
		{
			desc = "Go to next bookmark",
			cmd = function()
				require("bookmarks").bookmark_next()
			end,
			keys = { "n", "<LEADER>mn", { noremap = true } },
		},
		{
			desc = "Go to previous bookmark",
			cmd = function()
				require("bookmarks").bookmark_prev()
			end,
			keys = { "n", "<LEADER>mp", { noremap = true } },
		},
		{
			desc = "Remove all bookmarks",
			cmd = function()
				require("bookmarks").bookmark_clear_all()
			end,
			keys = { "n", "<LEADER>mx", { noremap = true } },
		},
		{
			desc = "List bookmarks",
			cmd = "<CMD>Telescope bookmarks list<CR>",
			keys = { "n", "<LEADER>ml", { noremap = true } },
		},
	},
}
