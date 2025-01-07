return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "pylsp", "ts_ls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local mason_registry = require("mason-registry")

            local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
                .. "\\node_modules\\@vue\\language-server"

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                init_options = {
                    plugins = { -- I think this was my breakthrough that made it work
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_language_server_path,
                            languages = { "vue" },
                        },
                    },
                },
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "gs", function()
                vim.cmd.vsplit()
                vim.lsp.buf.definition()
            end, {})
            vim.keymap.set("n", "gv", function()
                vim.cmd.split()
                vim.lsp.buf.definition()
            end, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, {})
            vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, {})
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>lc", vim.lsp.buf.incoming_calls, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

            vim.keymap.set("n", "]W", function()
                vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
            end)

            vim.keymap.set("n", "[W", function()
                vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
            end)

            vim.keymap.set("n", "]w", function()
                vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
            end)

            vim.keymap.set("n", "[w", function()
                vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
            end)

            vim.keymap.set("n", "<leader>d", function()
                vim.diagnostic.setqflist({})
            end)
        end,
    },
}
