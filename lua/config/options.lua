-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.env.PATH = vim.env.PATH .. ":" .. vim.env.HOME .. "/.dotnet/tools"
vim.opt.fixendofline = true
vim.filetype.add({ extension = { razor = "razor" } })
vim.treesitter.language.register("html", "razor")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "razor",
  callback = function()
    vim.b.autoformat = false
  end,
})
