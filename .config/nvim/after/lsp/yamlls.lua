return {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	settings = {
		yaml = {
			format = {
				enable = true,
				singleQuotes = true,
				bracketSpacing = true,
				proseWrap = "Always",
				printWidth = 80,
			},
			validate = true,
			completion = true,
			keyOrdering = false,
		},
		editor = {
			tabSize = 2,
		},
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
	},
}
