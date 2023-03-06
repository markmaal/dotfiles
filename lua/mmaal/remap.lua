vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Do not yank with x
vim.keymap.set("n", "x", "\"_x")

-- New Tab & Window Splitting
vim.keymap.set("n", "te", ":tabedit<Return>", { silent = true })
vim.keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Move window
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
