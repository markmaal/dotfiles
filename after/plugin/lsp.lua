local lsp = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = false, -- Using Lspsaga instead, see below
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
  sign_icons = { error = " ", warn = " ", hint = "ﴞ ", info = " " },
})

-- Setup LSPKind symbols for autocomplete boxes
lsp.setup_nvim_cmp({
    formatting = {
        format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 20,
            ellipsis_char = '..',
            menu = ({
                nvim_lsp = '[LSP]',
                emoji = '[Emoji]',
                path = '[Path]',
                calc = '[Calc]',
                vsnip = '[Snippet]',
                luasnip = '[Snippet]',
                buffer = '[Buffer]',
                tmux = '[TMUX]',
                treesitter = '[TreeSitter]',
            })
        }),
    },
});

-- Setup LSP Keybindings --
-- enable keybinds only for when lsp server available
lsp.on_attach(function(client, bufnr)
  -- keybind options

  -- set keybinds
  -- using lspsaga
  local describe = function(mode, key, cmd, desc)
      local opts = { noremap = true, silent = true, buffer = bufnr, desc = desc }
      vim.keymap.set(mode, key, cmd, opts) 
  end

  describe("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", "[g]o [f]ind") -- show definition, references
  vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  vim.keymap.set("n", "<leader>bd", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts) -- show buffer diagnostics
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
end)


-- Setup LSP servers if needed --
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim'
                }
            }
        }
    }
})
lsp.setup()
