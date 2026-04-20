return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
	},
	config = function()
		local dap = require("dap")
		local ui = require("dapui")
		require("dapui").setup()

		require("nvim-dap-virtual-text").setup({})

		local codelldb = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb,
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch main (no args)",
				type = "codelldb",
				request = "launch",
				program = "${workspaceFolder}/build/main",
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
			{
				name = "Launch main (with args)",
				type = "codelldb",
				request = "launch",
				program = "${workspaceFolder}/build/main",
				args = function()
					local args = vim.fn.input("args: ")
					return vim.split(args, " ", { trimempty = true })
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
			{
				name = "Launch file (no args)",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				args = function()
					local args = vim.fn.input("args: ")
					return vim.split(args, " ", { trimempty = true })
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
			{
				name = "Launch file (with args)",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				args = function()
					local args = vim.fn.input("args: ")
					return vim.split(args, " ", { trimempty = true })
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp

		-- Edit Breakpoints
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>db", dap.clear_breakpoints, { desc = "Clear Breakpoints" })
		vim.keymap.set("n", "<leader>cb", function()
			local condition = vim.fn.input("Condition: ")
			local hit_condition = vim.fn.input("Hits: ")
			local log_message = vim.fn.input("Log: ")
			dap.set_breakpoint(condition, hit_condition, log_message)
		end, { desc = "Set conditional Breakpoint" })

		-- View Breakpoints
		-- vim.keymap.set("n", "<leader>b?", function()
		-- 	dap.list_breakpoints()
		-- 	require("telescope.builtin").quickfix({
		-- 		fname_width = 15,
		-- 	})
		-- end, { desc = "List Breakpoints" })
		-- Eval var under cursor
		vim.keymap.set("n", "<leader>?", function()
			---@diagnostic disable-next-line: missing-fields
			require("dapui").eval(nil, { enter = true })
		end)

		-- Debugger navigation
		-- vim.keymap.set("n", "<leader>bf", dap.focus_frame, { desc = "Focus frame" })
		vim.keymap.set("n", "<leader>rb", dap.continue, { desc = "Continue" })
		vim.keymap.set("n", "<Down>", dap.step_over, { desc = "Step over" })
		vim.keymap.set("n", "<Right>", dap.step_into, { desc = "Step into" })
		vim.keymap.set("n", "<Up>", dap.step_out, { desc = "Step out" })
		vim.keymap.set("n", "<Left>", dap.step_back, { desc = "Step back" })

		-- vim.keymap.set("n", "<leader>br", dap.restart, { desc = "Restart" })
		vim.keymap.set("n", "<leader>xb", dap.terminate, { desc = "Terminate" })

		-- Debugger colorscheme
		-- local mocha = require("catppuccin.palettes").get_palette("mocha")
		-- vim.api.nvim_set_hl(1, "DapBreakpoint", { ctermbg = 0, fg = mocha.red })
		-- vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = mocha.yellow })
		-- vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = mocha.green, bg = mocha.mantle })

		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "◆", texthl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
		vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", numhl = "DapLogPoint" })
		vim.fn.sign_define(
			"DapStopped",
			{ text = "➤", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
		)

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end,
}
