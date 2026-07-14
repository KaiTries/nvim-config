return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install({
        "bash",
        "c_sharp",
        "css",
        "diff",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      })
      -- Enable highlighting whenever a parser exists for the buffer's language
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
        callback = function(event)
          pcall(vim.treesitter.start, event.buf)
        end,
      })
    end,
  },
}
