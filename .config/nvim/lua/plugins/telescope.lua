function preview_image(filepath, bufnr, opts)
	local is_image = function(filepath)
		local image_extensions = { "png", "jpg" } -- Supported image formats
		local split_path = vim.split(filepath:lower(), ".", { plain = true })
		local extension = split_path[#split_path]
		return vim.tbl_contains(image_extensions, extension)
	end
	if is_image(filepath) then
		local term = vim.api.nvim_open_term(bufnr, {})
		local function send_output(_, data, _)
			for _, d in ipairs(data) do
				vim.api.nvim_chan_send(term, d .. "\r\n")
			end
		end
		vim.fn.jobstart({
			"catimg",
			filepath, -- Terminal image viewer command
		}, { on_stdout = send_output, stdout_buffered = true, pty = true })
	else
		require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
	end
end

----------

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		lazy = false,
		dependencies = {
			-- Required Telescope dependency
			"nvim-lua/plenary.nvim",
			-- Recommended Telescope dependency for faster sorting performance
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			-- Sets vim.ui.select to telescope
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
		},
		init = function()
			local telescope = require("telescope")
			telescope.load_extension("live_grep_args")
			telescope.load_extension("ui-select")
		end,
		keys = {
			{ "<leader>fb", mode = "n", "<cmd>Telescope buffers<cr>", desc = "List buffers" },
			{ "<leader>fc", mode = "n", "<cmd>Telescope commands<cr>", desc = "List commands" },
			-- TODO install trouble for better diagnostics ?
			-- https://github.com/folke/trouble.nvim
			{ "<leader>fd", mode = "n", "<cmd>Telescope diagnostics<cr>", desc = "List workspace diagnostics" },
			{ "<leader>ff", mode = "n", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{
				"<leader>fF",
				mode = "n",
				"<cmd>Telescope find_files hidden=true<cr>",
				desc = "Find Files, including hidden ones",
			},
			{ "<leader>fg", mode = "n", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fG", mode = "n", "<cmd>Telescope live_grep_args<cr>", desc = "Live Grep with args" },
			{ "<leader>fh", mode = "n", "<cmd>Telescope help_tags<cr>", desc = "List help tags" },
			{ "<leader>fk", mode = "n", "<cmd>Telescope keymaps<cr>", desc = "List keymaps" },
			{ "<leader>fr", mode = "n", "<cmd>Telescope registers<cr>", desc = "List registers" },
			{ "<leader>ft", mode = "n", "<cmd>Telescope filetypes<cr>", desc = "List filetypes" },
			{ "<leader>fq", mode = "n", "<cmd>Telescope quickfix<cr>", desc = "List quickfix" },
			{ "<leader>fs", mode = "n", "<cmd>Telescope lsp_document_symbols<cr>", desc = "List LSP symbols" },
			{
				"<leader>fq",
				mode = "n",
				"<cmd>Telescope lsp_workspace_symbols<cr>",
				desc = "List LSP workspace symbols",
			},
		},
		opts = {
			defaults = {
				path_display = {
					truncate = 1,
				},
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						width = 0.9,
						height = 0.9,
						prompt_position = "bottom",
						preview_width = 0.9,
						preview_height = 0.6,
					},
				},
				preview = {
					mime_hook = function(filepath, bufnr, opts)
						preview_image(filepath, bufnr, opts)
					end,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = { require("telescope.themes").get_dropdown({}) },
			},
		},
	},
}
