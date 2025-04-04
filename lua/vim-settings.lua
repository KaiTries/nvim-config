local opt = vim.opt
local g = vim.g

-- GENERAL
opt.cmdheight = 2 -- height of cmd bar -> 2 so that output doesnt overwrite wincmd
g.mapleader = " " -- leader key space
g.maplocalleader = " " -- leader local
g.background = "light" -- highlighting -> dark background light highlighting
opt.showmode = false -- dont show vim mode -> already in status bar
opt.undofile = true -- store undos between session
opt.swapfile = false -- dont use swap file
opt.autochdir = false -- change directory based on file
opt.scrolloff = 8 -- start scrolling when 8 liens near edge
opt.inccommand = "split" -- preview substitutions in seperate window

-- LINE NUMBERING
opt.number = true -- always show line number column
opt.relativenumber = true -- use relative line numbers
opt.cursorline = false -- highlight line of cursor
opt.signcolumn = "yes" -- LSP error & warning markers column

-- TAB STUFF & FORMATTING
opt.tabstop = 2 -- how many spaces per tab
opt.shiftwidth = 2 -- amount to indent per tab (actual \t)
opt.softtabstop = 2 -- apply this many spaces per tab
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true
opt.cindent = true
opt.wrap = false

-- SEARCH
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.belloff = "all"

opt.title = true

-- WINDOW SETTINGS
opt.splitright = true -- splits new window to right
opt.splitbelow = true -- splits new window below

-- DISPLAY SETTINGS
opt.list = false -- if i want to show whitespaces like tabs and trailing whitespaces
