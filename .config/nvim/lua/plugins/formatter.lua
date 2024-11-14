return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                c = { "astyle" },
                -- rust = { "rustfmt", lsp_format = "fallback" },
                sh = { "beautysh" },
                bash = { "beautysh" },
                zsh = { "beautysh" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
        -- conform.formatters.clang_formatter = {
        -- }
        conform.formatters.prettier = {
            prepend_args = {
                "--use-tabs",
                "--tab-width",
                "4",
                "--single-quote",
            },
        }
        conform.formatters.stylua = {
            prepend_args = {
                "--config-path",
                "/home/apollo/.config/nvim/.stylua.toml",
            },
        }
        conform.formatters.astyle = {
            prepend_args = {
                "--style=google",
                "-t",
                "--break-after-logical",
                "--pad-oper",
                "--pad-comma",
            },
        }

        conform.formatters.dart_style = {
            command = "dart format -w . && sed -i 's/  /    /g' $(find . -name \"*.dart\")",
        }

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })

        vim.keymap.set({ "n", "v" }, "<leader>gf", function()
            conform.format({
                timeout_ms = 500,
                lsp_format = "fallback",
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
