return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nsidorenco/neotest-vstest",
    },
    keys = {
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run tests in file" },
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last test" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Test output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Test output panel" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop tests" },
    },
    opts = function()
      return {
        adapters = {
          require("neotest-vstest"),
        },
      }
    end,
  },
}
