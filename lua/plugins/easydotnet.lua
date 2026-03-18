return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },
  {
    "igorlfs/nvim-dap-view",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require("dap")
      local dapview = require("dap-view")

      dapview.setup()

      -- Auto-open/close UI with debug session
      dap.listeners.after.event_initialized["dapview_config"] = function()
        dapview.open()
      end
      dap.listeners.before.event_terminated["dapview_config"] = function()
        dapview.close()
      end
      dap.listeners.before.event_exited["dapview_config"] = function()
        dapview.close()
      end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {},
  },
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },
  -- disable csharp_ls - roslyn.nvim handles csharp lsp
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.csharp_ls = { enabled = false }
    end,
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
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap" },
    config = function()
      require("easy-dotnet").setup({
        csproj_search_depth = 5,
        lsp = { enabled = false },
      })
    end,
  },
}
