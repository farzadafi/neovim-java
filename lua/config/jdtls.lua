local function get_jdtls()
	-- Get the Mason Registry to gain access to downloaded binaries
	local mason_registry = require("mason-registry")
	-- Find the JDTLS package in the Mason Regsitry
	local jdtls = mason_registry.get_package("jdtls")
	-- Find the full path to the directory where Mason has downloaded the JDTLS binaries
	local jdtls_path = jdtls:get_install_path()
	-- Obtain the path to the jar which runs the language server
	local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
	-- Declare white operating system we are using, windows use win, macos use mac
	local SYSTEM = "linux"
	-- Obtain the path to configuration files for your specific operating system
	local config = jdtls_path .. "/config_" .. SYSTEM
	-- Obtain the path to the Lomboc jar
	local lombok = jdtls_path .. "/lombok.jar"
	return launcher, config, lombok
end
