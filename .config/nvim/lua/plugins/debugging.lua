return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = {
				"javadbg",
			},
			automatic_installation = true,
		},
		config = true,
	},
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

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define("DapBreakpointCondition", {
				text = "󰋗",
				texthl = "DapBreakpointCondition",
				linehl = "DapBreakpointCondition",
				numhl = "DapBreakpointCondition",
			})
			vim.fn.sign_define("DapBreakpointRejected", {
				text = "",
				texthl = "DapBreakpointRejected",
				linehl = "DapBreakpointRejected",
				numhl = "DapBreakpointRejected",
			})
			vim.fn.sign_define(
				"DapLogPoint",
				{ text = "󰛿", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
			)
		end,
		commander = {
			{
				desc = "Debugger - Start",
				cmd = function()
					require("dap").continue()
				end,
				keys = { "n", "<leader>ds", { noremap = true } },
			},
			{
				desc = "Debugger - Toggle breakpoint",
				cmd = function()
					require("dap").toggle_breakpoint()
				end,
				keys = { "n", "<leader>db", { noremap = true } },
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
		config = true,
		commander = {
			{
				desc = "Debugger - Toggle dap-ui",
				cmd = function()
					require("dapui").toggle()
				end,
				keys = { "n", "<leader>dut", { noremap = true } },
			},
			{
				desc = "Debugger - Toggle Floating Element",
				cmd = function()
					require("dapui").float_element()
				end,
				keys = { "n", "<leader>df", { noremap = true } },
			},
			{
				desc = "Debugger - Evaluate",
				cmd = function()
					require("dapui").eval()
				end,
				keys = { "v", "<leader>de", { noremap = true } },
			},
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = true,
			show_stop_reason = true,
			commented = true,
			only_first_definition = true,
			all_references = false,
			clear_on_continue = false,
		},
		config = true,
	},
	--[[{
		"mrcjkb/rustaceanvim",
		version = "^4",
	},]]
	--
}
