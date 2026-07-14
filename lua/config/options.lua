-- Loaded before lazy.nvim. Leader keys must be set before plugins load.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Global format-on-save toggle (see lua/plugins/formatting.lua)
vim.g.autoformat = true

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fixendofline = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.laststatus = 3
opt.list = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.shiftround = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.signcolumn = "yes"
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false

-- .NET: Roslyn LSP ships in the EasyDotnet dotnet global tool
vim.env.PATH = vim.env.PATH .. ":" .. vim.env.HOME .. "/.dotnet/tools"

vim.filetype.add({ extension = { razor = "razor" } })
vim.treesitter.language.register("html", "razor")

-- Razor LSP formatting is unreliable; skip autoformat for razor buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "razor",
  callback = function()
    vim.b.autoformat = false
  end,
})
