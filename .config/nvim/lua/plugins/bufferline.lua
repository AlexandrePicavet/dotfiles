return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "BufEnter",
	---@type bufferline.UserConfig
	opts = {
		options = {
			-- separator_style = "padded_slope",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " " or (e == "warning" and " " or " ")
					s = s .. n .. sym
				end
				return s
			end,
			custom_areas = {
				right = function()
					local result = {}
					local seve = vim.diagnostic.severity
					local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
					local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
					local info = #vim.diagnostic.get(0, { severity = seve.INFO })
					local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

					if error ~= 0 then
						table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
					end

					if warning ~= 0 then
						table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
					end

					if hint ~= 0 then
						table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
					end

					if info ~= 0 then
						table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
					end
					return result
				end,
			},
		},
	},
	config = true,
	commander = {
		{
			desc = "Previous buffer",
			cmd = "<CMD>BufferLineCyclePrev<CR>",
			keys = { "n", "<LEADER>bh", { noremap = true } },
		},
		{
			desc = "Move buffer to previous",
			cmd = "<CMD>BufferLineMovePrev<CR>",
			keys = { "n", "<LEADER>bH", { noremap = true } },
		},
		{
			desc = "Next buffer",
			cmd = "<CMD>BufferLineCycleNext<CR>",
			keys = { "n", "<LEADER>bl", { noremap = true } },
		},
		{
			desc = "Move buffer to next",
			cmd = "<CMD>BufferLineMoveNext<CR>",
			keys = { "n", "<LEADER>bL", { noremap = true } },
		},
		{
			desc = "Close buffer",
			cmd = "<CMD>bd<CR>",
			keys = { "n", "<LEADER>bc", { noremap = true } },
		},
		{
			desc = "Close Buffer ignore changes",
			cmd = "<CMD>bd!<CR>",
			keys = { "n", "<LEADER>bC", { noremap = true } },
		},
		{
			desc = "Pin buffer",
			cmd = "<CMD>BufferLineTogglePin<CR>",
			keys = { "n", "<LEADER>bp", { noremap = true } },
		},
	},
}
