local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Start or continue the debugger",
		},

		["<leader>di"] = {
			"<cmd> DapStepInto <CR>",
			"Step into",
		},
		["<leader>do"] = {
			"<cmd> DapStepOver <CR>",
			"Step over",
		},
		["<leader>dt"] = {
			"<cmd> DapTerminate <CR>",
			"Terminate",
		},
	},
}

M.dap_python = {
	plugin = true,
	n = {
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
		},
	},
}

return M
