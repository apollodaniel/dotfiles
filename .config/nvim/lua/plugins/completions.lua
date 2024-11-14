return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "doxnit/cmp-luasnip-choice",
        config = function()
            require("cmp_luasnip_choice").setup({
                auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
        config = function()
            local cmp = require("cmp")
            local sources = {
                --{ name = "cmp_bootstrap"},
                { name = "luasnip_choice" },
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For luasnip users.
            }
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources(sources, { name = "buffer" }),
            })

            cmp.setup.filetype("html", {
                sources = cmp.config.sources({
                    -- {name = "cmp_bootstrap"},
                    { name = "luasnip_choice" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                    -- other sources
                }),
            })
            cmp.setup.filetype("typescriptreact", {
                sources = cmp.config.sources({
                    -- {name = "cmp_bootstrap"},
                    { name = "luasnip_choice" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                    -- other sources
                }),
            })
        end,
    },
}
