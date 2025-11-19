local function eslint_format()
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "eslint"
		end,
	})
end

-- Override default formatter
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	callback = function()
		-- TODO check if eslint is configured before overriding keymap
		vim.keymap.set(
			{ "i", "n", "v" },
			"<C-f>",
			eslint_format,
			{ desc = "Format Typescript file with ESLint", noremap = true }
		)
	end,
})

return {}
