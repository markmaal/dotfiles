local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Use space as our leader key
vim.g.mapleader = " "

-- To quickly get into Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)
-- Do not yank with x
vim.keymap.set("n", "x", "\"_x")

-- vim modes --
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- Insert --
-- Quick Exit --
-- either jk or caps 
vim.keymap.set("i", "jk", "<ESC>")

-- New Tab & Window Splitting
vim.keymap.set("n", "te", ":tabedit<Return>", { silent = true })
vim.keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Navigate Buffers
vim.keymap.set("n", "<S-l>", ":bnext<Return>")
vim.keymap.set("n", "<S-h>", ":bprevious<Return>")

-- Move window
-- Still thinking of the best keybindings for these
-- Up
vim.keymap.set("n", "s<up>", "<C-w>k")
vim.keymap.set("n", "sk", "<C-w>k")
-- Down
vim.keymap.set("n", "s<down>", "<C-w>j")
vim.keymap.set("n", "sj", "<C-w>j")
-- Left
vim.keymap.set("n", "s<left>", "<C-w>h")
vim.keymap.set("n", "sh", "<C-w>h")
-- Right
vim.keymap.set("n", "s<right>", "<C-w>l")
vim.keymap.set("n", "sl", "<C-w>l")

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
-- Move text up and down 
vim.keymap.set("v", ">", ">gv")

-- Move text around and auto indent 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Stop yank filling buffer
vim.keymap.set("v", "p", "\"_dP")

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
