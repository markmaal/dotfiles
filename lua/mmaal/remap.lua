local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Use space as our leader key
vim.g.mapleader = " "

-- To quickly get into Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)
-- Do not yank with x
vim.keymap.set("n", "x", "\"_x", opts)

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
vim.keymap.set("i", "jk", "<ESC>", opts)

-- New Tab & Window Splitting
vim.keymap.set("n", "te", ":tabedit<Return>", term_opts)
vim.keymap.set("n", "ss", ":split<Return><C-w>w", term_opts)
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", term_opts)

-- Navigate Buffers
vim.keymap.set("n", "<S-l>", ":bnext<Return>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<Return>", opts)

-- Move window
-- Still thinking of the best keybindings for these
-- Up
vim.keymap.set("n", "s<up>", "<C-w>k", opts)
vim.keymap.set("n", "sk", "<C-w>k", opts)
-- Down
vim.keymap.set("n", "s<down>", "<C-w>j", opts)
vim.keymap.set("n", "sj", "<C-w>j", opts)
-- Left
vim.keymap.set("n", "s<left>", "<C-w>h", opts)
vim.keymap.set("n", "sh", "<C-w>h", opts)
-- Right
vim.keymap.set("n", "s<right>", "<C-w>l", opts)
vim.keymap.set("n", "sl", "<C-w>l", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
-- Move text up and down 
vim.keymap.set("v", ">", ">gv", opts)

-- Move text around and auto indent 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Stop yank filling buffer
vim.keymap.set("v", "p", "\"_dP", opts)

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
