vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.winborder = "rounded"
vim.g.have_nerd_font = true

vim.opt.smartindent = false
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.editorconfig = false

vim.opt.exrc = true
vim.opt.secure = true

-- Use tab for indentation
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0

vim.opt.fileformats = { "unix" }

vim.opt.colorcolumn = { 80, 95, 105, 120 }

vim.opt.list = true
vim.opt.listchars = "space:·,tab:→ ,trail:◼,nbsp:▢"

vim.opt.inccommand = 'split'
vim.opt.scrolloff = 5 -- Minimal number of lines to keep above and bellow the cursor.

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.laststatus = 3
