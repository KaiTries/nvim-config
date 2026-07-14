return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format()
        end,
        mode = { "n", "v" },
        desc = "Format",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        cs = { "csharpier" },
        razor = {},
      },
      -- Razor LSP formatting is slow; raise timeout to suppress warnings
      default_format_opts = {
        timeout_ms = 5000,
        lsp_format = "fallback",
      },
      format_on_save = function(bufnr)
        if vim.g.autoformat == false or vim.b[bufnr].autoformat == false then
          return
        end
        return {}
      end,
    },
  },
}
