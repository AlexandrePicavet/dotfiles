-- https://github.com/mfussenegger/nvim-dap/wiki/java
-- https://sookocheff.com/post/vim/nevim-java-ide/

local nvim_data = vim.fn.stdpath("data")

local root_dir = require("jdtls.setup").find_root({ "pom.xml", "build.gradle", "mvnw", "gradlew", ".git" })
if root_dir == nil then
	-- If not in a java project stop configuring jdtls
	return {}
end

local formatter = (function()
	local global_formatter = vim.fn.stdpath("config") .. "/assets/java/formatter.xml"
	local local_formatter = root_dir .. "/formatter.xml"

	if vim.fn.filereadable(local_formatter) == 1 then
		return local_formatter
	end

	return global_formatter
end)()
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.sha256(root_dir)
local jdtls_dir = vim.fn.expand("$MASON/packages/jdtls")
local lombok_path = jdtls_dir .. "/lombok.jar"
local jdtls_launcher = vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*jar")
local jdtls_configuration = jdtls_dir .. "/config_linux"
local java_debug_adapter_path = nvim_data .. "/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"
assert(vim.fn.filereadable(java_debug_adapter_path) == 1)

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

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*.java",
	callback = function()
		vim.cmd("silent! NeotestJava setup")
	end,
})

local jdtls = require("jdtls")
jdtls.extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local dap_setup_done = false

---@type vim.lsp.Config
return {
	filetypes = { "java" },
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=WARN",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. lombok_path,
		"-jar",
		jdtls_launcher,
		"-configuration",
		jdtls_configuration,
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	settings = {
		redhat = { telemetry = { enabled = false } },
		java = {
			eclipse = { downloadSources = true },
			recommendations = { dependency = { analytics = { show = true } } },
			symbols = { includeSourceMethodDeclarations = true },
			format = {
				enabled = true,
				comments = { enabled = false },
				onType = { enabled = false },
				settings = { url = formatter },
			},
			signatureHelp = { enabled = true },
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
	init_options = {
		bundles = { java_debug_adapter_path },
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
	},
	on_attach = function(_, _)
		if not dap_setup_done then
			require("jdtls").setup_dap({
				hotcodereplace = "auto",
				config_overrides = {},
			})
			dap_setup_done = true
		end
	end,
}
