require("commander").add({
	{
		desc = "Split vertical window",
		cmd = "<CMD>vsplit<CR>",
		keys = { "n", "<C-w>%", { noremap = true, silent = true } },
	},
	{
		desc = "Split horizontal window",
		cmd = "<CMD>split<CR>",
		keys = { "n", '<C-w>"', { noremap = true, silent = true } },
	},
	{
		desc = "Split vertical terminal",
		cmd = "<CMD>vsplit term://zsh<CR>",
		keys = { "n", "<C-w>t%", { noremap = true, silent = true } },
	},
	{
		desc = "Split horizontal terminal",
		cmd = "<CMD>split term://zsh<CR>",
		keys = { "n", '<C-w>t"', { noremap = true, silent = true } },
	},
})

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
