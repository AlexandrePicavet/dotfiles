local function dirty_buffers_count()
	local count = 0
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		local is_buffer_modified = vim.api.nvim_buf_is_loaded(buf)
				and vim.api.nvim_get_option_value("modified", { buf = buf })
				and vim.api.nvim_buf_get_name(buf) ~= ""

		if is_buffer_modified then
			count = count + 1
		end
	end

	return count > 0 and count .. " 󱙃" or ""
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"AndreM222/copilot-lualine",
	},
	opts = function()
		local colors = require("catppuccin.palettes").get_palette()

		return {
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					{
						"copilot",
						symbols = {
							status = {
								icons = {
									enabled = " ",
									sleep = " ", -- auto-trigger disabled
									disabled = " ",
									warning = " ",
									unknown = " ",
								},
								hl = (function()
									return {
										enabled = colors.green,
										sleep = colors.blue,
										disabled = colors.red,
										warning = colors.yellow,
										unknown = colors.text,
									}
								end)(),
							},
							spinners = "dots", -- has some premade spinners
							spinner_color = "#6272A4",
						},
						show_colors = true,
						show_loading = true,
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progess", "location" },

				lualine_z = {
					{ dirty_buffers_count, color = { bg = colors.red } },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		}
	end,
}
