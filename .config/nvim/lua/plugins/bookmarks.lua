return {
	"tomasky/bookmarks.nvim",
	after = "telescope.nvim",
	event = "VeryLazy",
	keys = function()
		local b = require("bookmarks")

		return {
			{ "<leader>mt", b.bookmark_toggle, mode = "n", desc = "Toggle bookmark" },
			{ "<leader>mi", b.bookmark_ann, mode = "n", desc = "Add or edit bookmark" },
			{ "<leader>mc", b.bookmark_clean, mode = "n", desc = "Remove all bookmarks from current buffer" },
			{ "<leader>mn", b.bookmark_next, mode = "n", desc = "Go to next bookmark" },
			{ "<leader>mp", b.bookmark_previous, mode = "n", desc = "Go to previous bookmark" },
			{ "<leader>ml", b.bookmark_list, mode = "n", desc = "List bookmarks" },
			{ "<leader>mx", b.bookmark_clear_all, mode = "n", desc = "Remove all bookmarks" },
		}
	end,
	opts = {
		save_file = (function()
			local bookmark_directory = os.getenv("HOME") .. "/.local/share/nvim/bookmarks/"
			vim.fn.mkdir(bookmark_directory, "p", "0o700")

			local bookmark_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			return bookmark_directory .. bookmark_name
		end)(),
		keywords = {
			["TODO"] = "󰄲 ",
			["WARN"] = " ",
			["FIX"] = "󰢷 ",
			["NOTE"] = "󰎞 ",
		},
	},
}
