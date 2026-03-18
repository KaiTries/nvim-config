return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
        razor = {},
      },
      -- Razor LSP formatting is slow; raise timeout to suppress warnings
      default_format_opts = {
        timeout_ms = 5000,
      },
    },
  },
}
