return {
	"mbbill/undotree",
	init = function()
		require("commander").add({
			{
				desc = "Undo Tree",
				cmd = "<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>",
				keys = { "n", "<leader>u", { noremap = true } },
			},
		})
	end,
}
