-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "use vim keys to navigate windows" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "use vim keys to navigate windows" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "use vim keys to navigate windows" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "use vim keys to navigate windows" })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "turn search highlights off" })

-- Keymap terminal specific
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]])

-- keymap for neo-tree plugin
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open parent directory in Oil float window" })

-- keymap for nvim-dap
vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Debugger Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Debugger Continue" })

-- keymap for lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show information about currently hovered" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition of currently hovered" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show possible code actions" })
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format the current file" })

-- Telescope keymaps in telescope.lua
