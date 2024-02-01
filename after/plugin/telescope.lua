local status, telescope = pcall(require, "telescope")
if not status then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local fb_actions = require('telescope').extensions.file_browser.actions

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ['q'] = actions.close
            },
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
                ['i'] = {
                    ['<C-w>'] = function() vim.cmd('normal vbd') end,
                },
                ['n'] = {
                    ['N'] = fb_actions.create,
                    ['h'] = fb_actions.goto_parent_dir,
                    ['/'] = function()
                        vim.cmd('startinsert')
                    end
                },
            },
        },
    },
}

telescope.load_extension "file_browser"
vim.keymap.set('n', ';r', function() builtin.live_grep() end)
vim.keymap.set('n', ';ff', builtin.find_files, {})
vim.keymap.set('n', ';p', builtin.git_files, {})
vim.keymap.set("n", ";fb", function()
    telescope.extensions.file_browser.file_browser({
        initial_mode = "normal"
    })
end)
