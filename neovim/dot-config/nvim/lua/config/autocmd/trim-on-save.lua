-- Trim trailing whitespace and blank lines on save
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Trim trailing whitespace and blank lines on save",
	pattern = "*",
	callback = function()
		vim.cmd([[silent! keepjumps keeppatterns mkview|%s/\s\+$//e|%s/\_s*\%$//e|loadview]])
	end,
})
