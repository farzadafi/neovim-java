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

local function get_bundles()
	-- Get the Mason Registry to gain access to downloaded binaries
	local mason_registry = require("mason-registry")
	-- Find the Java Debug Adapter package in the Mason Registry
	local java_debug = mason_registry.get_package("java-debug-adapter")
	-- Obtain the full path to the directory where Mason has downloaded the Java Debug Adapter binaries
	local java_debug_path = java_debug:get_install_path()

	local bundles = {
		vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
	}

	-- Find the Java Test package in the Mason Registry
	local java_test = mason_registry.get_package("java-test")
	-- Obtain the full path to the directory where Mason has downloaded the Java Test binaries
	local java_test_path = java_test:get_install_path()
	-- Add all of the Jars for running tests in debug mode to the bundles list
	vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", 1), "\n"))

	return bundles
end

local function get_workspace()
	-- Get the home directory of your operating system
	local home = os.getenv("HOME")
	-- Declare a directory where you would like to store project information
	local workspace_path = home .. "/code/workspace/"
	-- Determine the project name
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	-- Create the workspace directory by concatenating the designated workspace path and the project name
	local workspace_dir = workspace_path .. project_name
	return workspace_dir
end
