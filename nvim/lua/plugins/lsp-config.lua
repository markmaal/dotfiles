return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                PATH = "prepend",
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = false,
                ensure_installed = { "lua_ls", "gopls", "pylsp", "ts_ls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local vue_language_server_path = vim.fn.expand("$MASON/packages/vue-language-server")
            local angularls_path = vim.fn.expand("$MASON/packages/angular-language-server")

            local cmd = {
                "ngserver",
                "--stdio",
                "--tsProbeLocations",
                table.concat({
                    angularls_path,
                    vim.uv.cwd(),
                }, ","),
                "--ngProbeLocations",
                table.concat({
                    angularls_path .. "/node_modules/@angular/language-server",
                    vim.uv.cwd(),
                }, ","),
            }

            lspconfig.angularls.setup({
                cmd = cmd,
                on_new_config = function(new_config)
                    new_config.cmd = cmd
                end,
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- TS / Vue --
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

            -- Lua --
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            -- Go --
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            -- Python --
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
