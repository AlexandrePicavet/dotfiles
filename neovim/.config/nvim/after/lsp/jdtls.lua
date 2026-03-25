-- https://github.com/mfussenegger/nvim-dap/wiki/java
-- https://sookocheff.com/post/vim/nevim-java-ide/

local nvim_data = vim.fn.stdpath("data")

function get_workspace_dir()
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

	return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name
end

function get_formatter()
	local global_formatter = vim.fn.stdpath("config") .. "/assets/java/formatter.xml"

	local project_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h")
	local project_formatter = project_dir .. "/formatter.xml"

	return vim.fn.filereadable(project_formatter) > 0 and project_formatter or global_formatter
end

local jdtls_dir = vim.fn.expand("$MASON/packages/jdtls")
local lombok_path = jdtls_dir .. "/lombok.jar"
local jdtls_launcher = vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*jar")
local jdtls_configuration = jdtls_dir .. "/config_linux"
local java_debug_adapter_path = nvim_data .. "/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"

local dap = require("dap")

dap.configurations.java = {
	{
		type = "java",
		request = "attach",
		name = "Debug (Attach) - Remote",
		hostName = "127.0.0.1",
		port = 5005,
	},
}

vim.cmd("NeotestJava setup")

---@type vim.lsp.Config
return {
	filetypes = { "java" },
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. jdtls_dir .. "/lombok.jar",
		"-jar",
		jdtls_launcher,
		"-configuration",
		jdtls_configuration,
		"-data",
		get_workspace_dir(),
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
	settings = {
		capabilities = require("blink.cmp").get_lsp_capabilities(),
		redhat = { telemetry = { enabled = false } },
		java = {
			eclipse = { downloadSources = true },
			recommendations = { dependency = { analytics = { show = true } } },
			symbols = { includeSourceMethodDeclarations = true },
			format = {
				enabled = true,
				comments = { enabled = false },
				onType = { enabled = false },
				settings = { url = get_formatter() },
			},
			signatureHelp = { enabled = true },
			extendedClientCapabilities = require("jdtls").extendedClientCapabilities,
			maven = { downloadSources = true },
			references = { includeDecompiledSources = true },
			inlayHints = { parameterNames = { enabled = "all" } },
			referencesCodeLens = { enabled = true },
			implementationCodeLens = { enabled = true },
			completion = {
				enabled = true,
				chain = { enabled = true },
				overwrite = false,
				guessMethodArguments = "insertBestGuessedArguments",
				matchCase = "off",
			},
			compile = {
				nullAnalysis = {
					enabled = true,
					mode = "automatic",
				},
			},
			configuration = {
				updateBuildConfiguration = "automatic",
				edit = { validateAllOpenBuffersOnChange = true },
			},
		},
	},
	init_options = { bundles = { java_debug_adapter_path, lombok_path } },
	on_attach = function(_, _)
		require("jdtls").setup_dap({
			hotcodereplace = "auto",
			config_overrides = {},
		})
	end,
}
