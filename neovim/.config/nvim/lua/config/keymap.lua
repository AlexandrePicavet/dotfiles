require("which-key").add({
	-- Utilities
	{
		"<leader>fp",
		mode = "n",
		function()
			local filepath = vim.fn.expand("%")
			vim.fn.setreg("+", filepath)
			print("Filepath copied to clipboard: " .. filepath)
		end,
		desc = "Copy filepath to clipboard",
	},
	{
		"<f1>",
		mode = { "n", "i" },
		"<nop>",
		desc = "Disable F1 key",
	},

	-- LSP related
	{
		"grd",
		mode = "n",
		vim.lsp.buf.definition,
		desc = "vim.lsp.buf.definition()",
	},

	-- Buffer related
	{
		"<leader>bc",
		mode = "n",
		"<cmd>bp<bar>sp<bar>bn<bar>bd<cr>",
		desc = "Buffer close",
	},
	{
		"<leader>bC",
		mode = "n",
		"<cmd>bp<bar>sp<bar>bn<bar>bd!<cr>",
		desc = "Buffer close",
	},

	-- Add quickfix keymaps
	{
		"<leader>qo",
		mode = "n",
		"<cmd>copen<cr>",
		desc = "Quickfix open",
	},
	{
		"<leader>qc",
		mode = "n",
		"<cmd>cclose<cr>",
		desc = "Quickfix close",
	},

	-- Center screen after search
	{
		"*",
		mode = "n",
		"*zz",
	},
	{
		"n",
		mode = "n",
		"nzz",
	},
	{
		"N",
		mode = "n",
		"Nzz",
	},
})
