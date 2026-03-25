local function toggle_special_breakpoint()
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
end

return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = function(_, opts)
			opts.automatic_installation = true

			return opts
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		keys = function()
			local dap = require("dap")

			return {
				{ "<leader>dbt", mode = "n", "<cmd>DapToggleBreakpoint<cr>", desc = "[Debugger] Toggle breakpoint" },
				{ "<leader>dbs", mode = "n", toggle_special_breakpoint, desc = "[Debugger] Toggle special breakpoint" },
				{ "<leader>dbl", mode = "n", dap.list_breakpoints, desc = "[Debugger] List breakpoints" },
				{ "<leader>dbc", mode = "n", "<cmd>DapClearBreakpoints<cr>", desc = "[Debugger] Clear breakpoints" },
				{ "<leader>dc", mode = "n", "<cmd>DapContinue<cr>", desc = "[Debugger] Continue" },
				{ "<leader>drc", mode = "n", dap.reverse_continue, desc = "[Debugger] Reverse Continue" },
				{ "<leader>dso", mode = "n", "<cmd>DapStepOver<cr>", desc = "[Debugger] Step over" },
				{ "<leader>dsi", mode = "n", "<cmd>DapStepInto<cr>", desc = "[Debugger] Step into" },
				{ "<leader>dsu", mode = "n", "<cmd>DapStepOut<cr>", desc = "[Debugger] Step out" },
				{ "<leader>dsb", mode = "n", dap.step_back, desc = "[Debugger] Step back" },
				{ "<leader>dtc", mode = "n", dap.run_to_cursor, desc = "[Debugger] Run to cursor" },
				{ "<leader>dq", mode = "n", dap.close, desc = "[Debugger] Close" },
				{ "<leader>dk", mode = "n", dap.terminate, desc = "[Debugger] Terminate" },
			}
		end,
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
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		opts = {},
		config = true,
		keys = function()
			local dapui = require("dapui");
			return {
				{ "<leader>dut", mode = "n", dapui.toggle, desc = "[Debugger] Toggle dap-ui" },
				{ "<leader>df", mode = "n", dapui.float_element, desc = "[Debugger] Toggle Floating Element" },
				{ "<leader>de", mode = "v", dapui.eval, desc = "[Debugger] Evaluate" },
				{ "<leader>dwa", mode = "n", function()
					dapui.elements.watches.add()
				end, desc = "[Debugger] Add watch" },
			}
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
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
}
