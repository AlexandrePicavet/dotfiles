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
	{
		desc = "Copy filepath to clipboard",
		cmd = function()
			local filepath = vim.fn.expand("%")
			vim.fn.setreg("+", filepath)
			print("Filepath copied to clipboard: " .. filepath)
		end,
		keys = { "n", "<leader>fp", { noremap = true } },
	},
})

vim.keymap.set("t", "<C-Space>", [[<C-\><C-n>]])
-- Disable help mapping
vim.keymap.set("n", "<F1>", "<NOP>")
vim.keymap.set("i", "<F1>", "<NOP>")
