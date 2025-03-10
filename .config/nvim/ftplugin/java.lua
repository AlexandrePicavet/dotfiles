-- https://github.com/mfussenegger/nvim-dap/wiki/java
-- https://sookocheff.com/post/vim/nevim-java-ide/
vim.opt.expandtab = false

local home = os.getenv("HOME")
local nvim_dir = home .. "/.local/share/nvim"
local workspace_path = nvim_dir .. "/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local project_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h")
local workspace_dir = workspace_path .. project_name

local global_formatter = home .. "/.config/nvim/assets/java/formatter.xml"
local project_formatter = project_dir .. "/formatter.xml"
local formatter = vim.fn.filereadable(project_formatter) and project_formatter or global_formatter

local jdtls = require("jdtls")
local jdtls_dir = nvim_dir .. "/mason/packages/jdtls"
local jdtls_launcher = vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*jar")
local jdtls_configuration = jdtls_dir .. "/config_linux"
local java_debug_adapter_path = nvim_dir .. "/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"

local dap = require("dap")

local config = {
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
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
	settings = {
		capabilities = require("blink.cmp").get_lsp_capabilities(),
		java = {
			eclipse = {
				downloadSources = true,
			},
			recommendataions = {
				dependency = {
					analytics = {
						show = true,
					},
				},
			},
			symbols = {
				includeSourceMethodDeclarations = true,
			},
			format = {
				enable = true,
				comments = {
					enabled = false,
				},
				onType = {
					enabled = false,
				},
				settings = {
					url = formatter,
				},
			},
			signatureHelp = { enabled = true },
			extendedClientCapabilities = jdtls.extendedClientCapabilities,
			maven = {
				downloadSources = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
			},
			referencesCodeLens = {
				enabled = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
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
				runtimes = {
					{
						name = "JAVASE-11",
						-- path = "/usr/lib/jvm/java-11-openjdk/",
						-- sources = "/usr/share/licenses/openjdk11-src/",
						javadoc = "https://docs.oracle.com/en/java/javase/11/docs/api",
					},
					{
						name = "JAVASE-17",
						-- path = "/usr/lib/jvm/java-17-openjdk/",
						-- sources = "/usr/share/licenses/openjdk17-src/",
						javadoc = "https://docs.oracle.com/en/java/javase/17/docs/api",
					},
					{
						name = "JavaSE-21",
						-- path = "/usr/lib/jvm/java-21-openjdk/",
						-- sources = "/usr/share/licenses/openjdk21-src/",
						javadoc = "https://docs.oracle.com/en/java/javase/21/docs/api",
						default = true,
					},
				},
				maven = {
					downloadSources = true,
				},
			},
		},
	},
	init_options = {
		bundles = {
			java_debug_adapter_path,
		},
	},
	on_attach = function(_, _)
		require("jdtls").setup_dap({
			hotcodereplace = "auto",
			config_overrides = {},
		})
	end,
}

jdtls.start_or_attach(config)

dap.configurations.java = {
	{
		type = "java",
		request = "attach",
		name = "Debug (Attach) - Remote",
		hostName = "127.0.0.1",
		port = 5005,
	},
}
