return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local lspconfig = require("lspconfig")
      local original_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ccls.setup({
        capabilities = capabilities,
        cmd = {
          "ccls",
          "--offset-encoding=utf-16",
        },
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        flags = { debounce_text_changes = 500 },
        on_attach = function(client, _)
          client.server_capabilities.document_formatting = true
          if client.server_capabilities.document_formatting then
            local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
            vim.api.nvim_create_autocmd("BufWritePre", {
              pattern = "*",
              callback = function()
                vim.lsp.buf.format(nil)
              end,
              group = au_lsp,
            })
          end
        end,
      })
      vim.diagnostic.config({ virtual_text = true })
    end,
  },
}
