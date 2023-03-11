local status, nvimtree = pcall(require, "nvim-tree")
if not status then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- To quickly get into Netrw
local opts = { noremap = true, silent = true }
vim.keymap.set("n", ";e", "<cmd>NvimTreeToggle<CR>", opts)

nvimtree.setup({
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})
