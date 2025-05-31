function isUNIX()
    return vim.fn.has("macunix") == 1
end

local function contains(tbl, val)
    for _, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

return {
    {
        "nvim-neotest/neotest",
        ent = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-jest",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-vim-test",
            { "fredrikaverpil/neotest-golang", version = "*" },
        },

        keys = {
            {
                "<leader>ta",
                function()
                    require("neotest").run.attach()
                end,
                desc = "Attach",
            },
            {
                "<leader>tf",
                function()
                    require("neotest").run.run(vim.fn.expand("%"))
                end,
                desc = "Run File",
            },
            {
                "<leader>tA",
                function()
                    require("neotest").run.run(vim.uv.cwd())
                end,
                desc = "Run All Test Files",
            },
            {
                "<leader>tT",
                function()
                    require("neotest").run.run({ suite = true })
                end,
                desc = "Run Test Suite",
            },
            {
                "<leader>tn",
                function()
                    require("neotest").run.run()
                end,
                desc = "Run Nearest",
            },
            {
                "<leader>tl",
                function()
                    require("neotest").run.run_last()
                end,
                desc = "Run Last",
            },
            {
                "<leader>ts",
                function()
                    require("neotest").summary.toggle()
                end,
                desc = "Toggle Summary",
            },
            {
                "<leader>to",
                function()
                    require("neotest").output.open({ enter = true, auto_close = true })
                end,
                desc = "Show Output",
            },
            {
                "<leader>tO",
                function()
                    require("neotest").output_panel.toggle()
                end,
                desc = "Toggle Output Panel",
            },
            {
                "<leader>tt",
                function()
                    require("neotest").run.stop()
                end,
                desc = "Terminate",
            },
            {
                "<leader>td",
                function()
                    vim.cmd("Neotree close")
                    require("neotest").summary.close()
                    require("neotest").output_panel.close()
                    require("neotest").run.run({ suite = false, strategy = "dap" })
                end,
                desc = "Debug nearest test",
            },
        },
        config = function()
            -- get neotest namespace (api call creates or returns namespace)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message =
                            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
            local adapters = {}

            -- Check if the current buffer's filetype is 'javascript'
            if contains({ "javascript", "typescript" }, vim.bo.filetype) then
                table.insert(
                    adapters,
                    require("neotest-jest")({
                        jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h")),
                        jestConfigFile = function()
                            local file = vim.fn.expand("%:p")
                            if string.find(file, "/(app/") then
                                return string.match(file, "(.~/[^/]+/)src") .. "jest.config.js"
                            end
                            return vim.fn.getcwd() .. "/jest.config.ts"
                        end,
                        env = { CI = true },
                        cwd = function(path)
                            return vim.fn.getcwd()
                        end,
                    })
                )
            end

            -- Add other adapters unconditionally
            table.insert(
                adapters,
                require("neotest-vim-test")({
                    ignore_file_types = { "python", "vim", "lua", "js", "ts" },
                })
            )
            table.insert(adapters, require("neotest-python"))
            table.insert(
                adapters,
                require("neotest-golang")({
                    runner = isUNIX() and "go" or "gotestsum",
                    go_test_args = {
                        "-v",
                        "-count=1",
                        "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
                    },
                })
            )
            require("neotest").setup({
                adapters = adapters,
            })
        end,
    },
    {
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>tc", "<cmd>Coverage<cr>",                             desc = "Coverage in gutter" },
            { "<leader>tC", "<cmd>CoverageLoad<cr><cmd>CoverageSummary<cr>", desc = "Coverage summary" },
        },
        opts = {
            auto_reload = true,
            lang = {
                go = {
                    coverage_file = vim.fn.getcwd() .. "/coverage.out",
                },
            },
        },
    },
}
