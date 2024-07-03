vim.opt.expandtab = false

local home = os.getenv("HOME")
local nvim_dir = home .. "/.local/share/nvim"
local workspace_path = nvim_dir .. "/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local jdtls = require("jdtls")
local jdtls_dir = nvim_dir .. "/mason/packages/jdtls"
local jdtls_launcher = vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*jar")
local jdtls_configuration = jdtls_dir .. "/config_linux"

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
		java = {
			signatureHelp = { enabled = true },
			extendedClientCapabilities = jdtls.extendedClientCapabilities,
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
			},
			format = {
				enabled = false,
			},
		},
	},
	init_options = {
		bundles = {},
	},
}

jdtls.start_or_attach(config)
