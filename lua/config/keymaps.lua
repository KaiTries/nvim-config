-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DAP (Debugger)
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, { desc = "Conditional breakpoint" })
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>dn", function() require("dap").step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", function() require("dap").step_out() end, { desc = "Step out" })
vim.keymap.set("n", "<leader>dq", function() require("dap").terminate() end, { desc = "Terminate" })
vim.keymap.set("n", "<leader>dr", function() require("dap").restart() end, { desc = "Restart" })
vim.keymap.set("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Run last" })
vim.keymap.set("n", "<leader>dp", function() require("dap").pause() end, { desc = "Pause" })
vim.keymap.set("n", "<leader>dR", function() require("dap").repl.toggle() end, { desc = "Toggle REPL" })

-- DAP UI
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>de", function() require("dapui").eval() end, { desc = "Eval expression" })
vim.keymap.set("v", "<leader>de", function() require("dapui").eval() end, { desc = "Eval selection" })

-- easy-dotnet debug
vim.keymap.set("n", "<leader>dd", function() require("easy-dotnet").debug_project() end, { desc = "Debug .NET project" })
