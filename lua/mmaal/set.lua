-- Mapping space as leader
vim.g.mapleader = " "

-- Fat cursor
vim.opt.guicursor = ""

-- Line number and relative number
vim.opt.nu = true
vim.opt.relativenumber = true

-- Formatting --
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.cursorline = true
-- Undotree --
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Formatting Searches --
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true


vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

