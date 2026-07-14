return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      explorer = { enabled = true },
      picker = {
        sources = {
          files = { hidden = true },
          explorer = { hidden = true },
        },
      },
    },
    keys = {
      -- Find
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart find files" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
      -- Search
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep word", mode = { "n", "x" } },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "Help pages" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume last picker" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
      -- LSP navigation
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, desc = "References", nowait = true },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto type definition" },
      -- Git / misc
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification history" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
    },
  },
}
