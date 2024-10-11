return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- UI plugins to make debugging simpler
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		-- Gain access to the dap plugin and its functions
		local dap = require("dap")
		-- Gain access to the dap ui plugin and its functions
		local dapui = require("dapui")

		-- Setup the dap ui with default configuration
		dapui.setup()

		-- Setup an event listener for when the debugger is launched
		dap.listeners.before.launch.dapui_config = function()
			-- When the debugger is launched, open up the debug UI
			dapui.open()
		end

		-- Set a vim motion for <Space> + d + t to toggle a breakpoint at the line where the cursor is currently on
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })

		-- Set a vim motion for <Space> + d + s to start the debugger and launch the debugging UI
		vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [S]tart" })

		-- Set a vim motion for <Space> + d + i to step into a function
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug [S]tep [I]nto" })

		-- Set a vim motion for <Space> + d + c to continue execution until the next breakpoint
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug [S]tep [C]ontinue" })

		-- Set a vim motion for <Space> + d + o to step out of the current function
		vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "[D]ebug [S]tep [O]ut" })

		-- Set a vim motion to close the debugging UI
		vim.keymap.set("n", "<leader>dC", dapui.close, { desc = "[D]ebug [C]lose" })
	end,
}
