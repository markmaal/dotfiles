local status, bufferline = pcall(require, "bufferline")
if not status then return end


bufferline.setup({
    options = {
        mode = "tabs",
        separator_style = "slant",
        always_show_bufferline = false,
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        color_icons = true
    },
    highlights = require('rose-pine.plugins.bufferline')
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
