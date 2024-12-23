return {
	"quentingruber/pomodoro.nvim",
	lazy = false,
	opts = {
		start_at_launch = false,
		work_duration = 25,
		break_duration = 5,
		delay_duration = 1,
		long_break_duration = 15,
		breaks_before_long = 4,
	},
	commander = {
		{
			desc = "Pomodoro UI",
			cmd = "<CMD>PomodoroUI<CR>",
			keys = { "n", "<LEADER>Pu", { noremap = true } },
		},
		{
			desc = "Pomodoro Start",
			cmd = "<CMD>PomodoroStart<CR>",
			keys = { "n", "<LEADER>Ps", { noremap = true } },
		},
		{
			desc = "Pomodoro Stop",
			cmd = "<CMD>PomodoroStop<CR>",
			keys = { "n", "<LEADER>PS", { noremap = true } },
		},
		{
			desc = "Pomodoro Break Delay",
			cmd = "<CMD>PomodoroDelayBreak<CR>",
			keys = { "n", "<LEADER>Pbd", { noremap = true } },
		},
		{
			desc = "Pomodoro Break Skip",
			cmd = "<CMD>PomodoroSkipBreak<CR>",
			keys = { "n", "<LEADER>Pbs", { noremap = true } },
		},
		{
			desc = "Pomodoro Break Force",
			cmd = "<CMD>PomodoroForceBreak<CR>",
			keys = { "n", "<LEADER>Pbf", { noremap = true } },
		},
	}
}
