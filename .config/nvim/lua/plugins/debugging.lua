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

			vim.fn.sign_define("DapBreakpoint", {
				text = "",
				texthl = "DapBreakpoint",
				linehl = "DapBreakpoint",
				numhl = "DapBreakpoint",
			})
			vim.fn.sign_define("DapBreakpointCondition", {
				text = "󰋗",
				texthl = "DapBreakpointCondition",
				linehl = "DapBreakpointCondition",
				numhl = "DapBreakpointCondition",
			})
			vim.fn.sign_define("DapBreakpointRejected", {
				text = "",
				texthl = "DapBreakpointRejected",
				linehl = "DapBreakpointRejected",
				numhl = "DapBreakpointRejected",
			})
			vim.fn.sign_define("DapLogPoint", {
				text = "󰛿",
				texthl = "DapLogPoint",
				linehl = "DapLogPoint",
				numhl = "DapLogPoint",
			})
			vim.fn.sign_define("DapStopped", {
				text = "",
				texthl = "DapStopped",
				linehl = "DapStopped",
				numhl = "DapStopped",
			})
		end,
		commander = {
			{
				desc = "Debugger - Toggle breakpoint",
				cmd = function()
					require("dap").toggle_breakpoint()
				end,
				keys = { "n", "<leader>dbt", { noremap = true } },
			},
			{
				desc = "Debugger - Toggle special breakpoint",
				cmd = function()
					local condition_type = "Condition"
					local hit_condition_type = "Hit condition"
					local log_type = "Log"
					vim.ui.select({
						condition_type,
						hit_condition_type,
						log_type,
					}, {
						prompt = "Select a breakpoint type: ",
					}, function(type)
						local dap = require("dap")
						if type == condition_type then
							vim.ui.input({ prompt = "Condition: " }, function(condition)
								if condition == nil then
									return
								end

								dap.set_breakpoint(condition)
							end)
						elseif type == hit_condition_type then
							vim.ui.input({ prompt = "How often should be visited to stop: " }, function(hit_condition)
								if hit_condition == nil then
									return
								elseif tonumber(hit_condition, 10) == nil then
									print("The Hit condition must be a number but got: " .. hit_condition)
									return
								end

								dap.set_breakpoint(nil, hit_condition)
							end)
						elseif type == log_type then
							vim.ui.input({ prompt = "Log message: " }, function(log)
								if log == nil then
									return
								end

								dap.set_breakpoint(nil, nil, log)
							end)
						end
					end)
				end,
				keys = { "n", "<leader>dbs", { noremap = true } },
			},
			{
				desc = "Debugger - List breakpoints",
				cmd = function()
					require("dap").list_breakpoints()
				end,
				keys = { "n", "<leader>dbl", { noremap = true } },
			},
			{
				desc = "Debugger - Clear breakpoints",
				cmd = function()
					require("dap").clear_breakpoints()
				end,
				keys = { "n", "<leader>dbc", { noremap = true } },
			},
			{
				desc = "Debugger - Continue",
				cmd = function()
					require("dap").continue()
				end,
				keys = { "n", "<leader>dc", { noremap = true } },
			},
			{
				desc = "Debugger - Reverse Continue",
				cmd = function()
					require("dap").reverse_continue()
				end,
				keys = { "n", "<leader>drc", { noremap = true } },
			},
			{
				desc = "Debugger - Step over",
				cmd = function()
					require("dap").step_over()
				end,
				keys = { "n", "<leader>dso", { noremap = true } },
			},
			{
				desc = "Debugger - Step into",
				cmd = function()
					require("dap").step_into()
				end,
				keys = { "n", "<leader>dsi", { noremap = true } },
			},
			{
				desc = "Debugger - Step out",
				cmd = function()
					require("dap").step_out()
				end,
				keys = { "n", "<leader>dsu", { noremap = true } },
			},
			{
				desc = "Debugger - Step back",
				cmd = function()
					require("dap").step_back()
				end,
				keys = { "n", "<leader>dsb", { noremap = true } },
			},
			{
				desc = "Debugger - To cursor",
				cmd = function()
					require("dap").run_to_cursor()
				end,
				keys = { "n", "<leader>dtc", { noremap = true } },
			},
			{
				desc = "Debugger - Close",
				cmd = function()
					require("dap").close()
				end,
				keys = { "n", "<leader>dq", { noremap = true } },
			},
			{
				desc = "Debugger - Terminate",
				cmd = function()
					require("dap").terminate()
				end,
				keys = { "n", "<leader>dk", { noremap = true } },
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		opts = {},
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
			{
				desc = "Debugger - Add watch",
				cmd = function()
					require("dapui").elements.watches.add()
				end,
				keys = { "n", "<leader>dwa", { noremap = true } },
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
