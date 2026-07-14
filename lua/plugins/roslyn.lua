return {
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    opts = {},
    config = function(_, opts)
      -- Filter out malformed diagnostics where range is userdata (vim.NIL)
      -- instead of a proper LSP range table. Roslyn occasionally sends these.
      local orig = vim.lsp.handlers["textDocument/publishDiagnostics"]
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        if result and result.diagnostics then
          result.diagnostics = vim.tbl_filter(function(d)
            return type(d.range) == "table"
          end, result.diagnostics)
        end
        orig(err, result, ctx, config)
      end
      require("roslyn").setup(opts)
    end,
  },
}
