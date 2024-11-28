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
		end,
		commander = {
			{
				desc = "Toggle breakpoint",
				cmd = function()
					require("dap").toggle_breakpoint()
				end,
				keys = { "n", "<leader>tb", { noremap = true } },
			},
			{
				desc = "Debugger - Continue",
				cmd = function()
					require("dap").continue()
				end,
				keys = { "n", "<leader>dc", { noremap = true } },
			},
		},
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
