return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			require("commander").add({
				{
					desc = "Toggle breakpoint",
					cmd = dap.toggle_breakpoint,
					keys = { "n", "<leader>tb", { noremap = true } },
				},
				{
					desc = "Debugger - Continue",
					cmd = dap.continue,
					keys = { "n", "<leader>dc", { noremap = true } },
				},
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	--[[{
		"mrcjkb/rustaceanvim",
		version = "^4",
	},]]
	--
}
