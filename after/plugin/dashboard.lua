local db = require("dashboard")
db.setup {
    theme = 'hyper',
    config = {
        week_header = {
            enable = true
        },
        shortcut = {
            { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
            },
            {
                desc = ' dotfiles',
                group = 'Number',
                action = 'cd ~/.config/nvim | Telescope find_files',
                key = 'd',
            },
        },
    },
}
