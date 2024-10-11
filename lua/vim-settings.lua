local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.background = "light"

opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.cindent = true
opt.wrap = false

opt.incsearch = true
opt.signcolumn = "yes"

opt.scrolloff = 8

opt.ignorecase = true
opt.smartcase = true

opt.belloff = "all"

opt.hlsearch = false

opt.title = true

opt.autochdir = true

-- keymap for neo-tree plugin
vim.keymap.set("n", "<leader>e", ":Neotree focus reveal left toggle\n")
