local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

-- Load friendly snippets
local luasnip = require('luasnip')
luasnip.config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave'
})

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"
cmp.setup({
    sources = cmp.config.sources({
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
    }),
    formatting = {
        fields = {'abbr', 'menu', 'kind'},
        format = lspkind.cmp_format({ with_text = true, maxwidth = 30 })
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end, {'i', 's'}),
    }),
})
