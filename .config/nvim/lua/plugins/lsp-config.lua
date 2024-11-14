return {
    -- rust specific configs
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false, -- This plugin is already lazy,
        config = function()
            local bufnr = vim.api.nvim_get_current_buf()
            vim.keymap.set("n", "<leader>ca", function()
                vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
                -- or vim.lsp.buf.codeAction() if you don't want grouping.
            end, { silent = true, buffer = bufnr })
        end,
    },
    -- flutter specific
    {
        "nvim-flutter/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
        config = true,
    },
    {
        "iabdelkareem/csharp.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "mfussenegger/nvim-dap",
            "Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
        },
        config = function()
            require("mason").setup()
            require("csharp").setup()
            local mason_tool_installer = require("mason-tool-installer")
            mason_tool_installer.setup({
                ensure_installed = {
                    "prettier", -- prettier formatter
                    "stylua", -- lua formatter
                    "isort", -- python formatter
                    "black", -- python formatter
                    "pylint", -- python linter
                    "eslint_d", -- js linter
                    "codelldb",
                    "cpptools",
                    "typescript-language-server",
                    "html-lsp",
                    "clangd",
                    "dockerfile-language-server",
                    "docker-compose-language-service",
                    "python-lsp-server",
                    "asm-lsp",
                    "rust-analyzer",
                    "ast-grep",
                    "bash-language-server",
                    "awk-language-server",
                    -- "omnisharp",
                    "lua-language-server",
                    "tailwindcss-language-server",
                    "css-variables-language-server",
                    "css-lsp",
                    "cssmodules-language-server",
                    "harper-ls",
                    "yaml-language-server",
                    "emmet-ls",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                -- Enable only the top widget bar
                lightbulb = {
                    enable = false,
                },
                rename = {
                    enable = true,
                },
                hover = {
                    enable = false,
                },
                code_action = {
                    enable = false,
                },
                diagnostic = {
                    enable = false,
                },
                definition = {
                    enable = false,
                },
                finder = {
                    enable = false,
                },
                outline = {
                    enable = false,
                },
                ui = {
                    border = "rounded", -- or 'single', 'double', 'shadow', etc.
                    title = "LSP Saga",
                    -- other UI options you might need
                },
            })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons", -- optional
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local function set_filetype(pattern, filetype)
                vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
                    pattern = pattern,
                    command = "set filetype=" .. filetype,
                })
            end
            set_filetype({ "docker-compose.yml" }, "yaml.docker-compose")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport =
                true

            capabilities.textDocument.completion.completionItem.preselectSupport =
                true
            capabilities.textDocument.completion.completionItem.insertReplaceSupport =
                true
            capabilities.textDocument.completion.completionItem.labelDetailsSupport =
                true
            capabilities.textDocument.completion.completionItem.deprecatedSupport =
                true
            capabilities.textDocument.completion.completionItem.commitCharactersSupport =
                true
            capabilities.textDocument.completion.completionItem.tagSupport =
                { valueSet = { 1 } }
            capabilities.textDocument.completion.completionItem.resolveSupport =
                {
                    properties = {
                        "documentation",
                        "detail",
                        "additionalTextEdits",
                        "properties",
                    },
                }
            local lspconfig = require("lspconfig")

            local lsp_servers = {
                "ts_ls",
                -- "solargraph",
                "html",
                "clangd",
                "dockerls",
                "docker_compose_language_service",
                "pylsp",
                -- "csharp_ls",
                "asm_lsp",
                -- "rust_analyzer",
                -- "ast_grep",
                "bashls",
                "awk_ls",
                -- "omnisharp",
            }

            for _, lsp in ipairs(lsp_servers) do
                lspconfig[lsp].setup({
                    -- on_attach = my_custom_on_attach,
                    capabilities = capabilities,
                })
            end
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                filetypes = { "lua" },
            })
            -- lspconfig.omnisharp.setup({
            --     capabilities = capabilities,
            --     filetypes = { "cs" },
            -- })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                filetypes = { "css", "sass", "less", "typescriptreact", "html" },
            })

            lspconfig.css_variables.setup({
                capabilities = capabilities,
                filetypes = { "css", "scss", "less" },
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
                filetypes = { "css", "scss", "less" },
            })
            lspconfig.cssmodules_ls.setup({
                capabilities = capabilities,
                filetypes = {
                    "javascriptreact",
                    "typescriptreact",
                    "css",
                    "scss",
                    "less",
                    "html",
                },
            })

            lspconfig.harper_ls.setup({
                capabilities = capabilities,
                filetypes = { "toml", "markdown" },
            })

            lspconfig.yamlls.setup({
                --on_attach = on_attach,
                filetypes = { "yaml", "yml" },
                capabilities = capabilities,
                flags = { debounce_test_changes = 150 },
                settings = {
                    yaml = {
                        format = {
                            enable = true,
                            singleQuote = true,
                            printWidth = 120,
                        },
                        hover = true,
                        completion = true,
                        validate = true,
                        schemas = {
                            ["https://raw.githubusercontent.com/awslabs/goformation/v6.10.0/schema/cloudformation.schema.json"] = {
                                "/cloudformation.yml",
                                "/cloudformation.yaml",
                                "/*.cf.yml",
                                "/cf.yaml",
                            },
                            ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
                                "/.gitlab-ci.yml",
                                "/.gitlab-ci.yaml",
                            },
                            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                                "**/docker-compose*.y*ml",
                            },
                        },
                        schemaStore = {
                            enable = true,
                            url = "https://www.schemastore.org/json",
                        },
                    },
                },
            })

            lspconfig.emmet_ls.setup({
                -- on_attach = on_attach,
                capabilities = capabilities,
                filetypes = {
                    -- "javascript",
                    -- "javascriptreact",
                    "less",
                    "sass",
                    "scss",
                    -- "svelte",
                    -- "pug",
                    -- "typescriptreact",
                    -- "vue",
                },
                init_options = {
                    html = {
                        options = {
                            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                            ["bem.enabled"] = true,
                        },
                    },
                },
            })
            --lspconfig.tailwindcss.setup({})

            --lspconfig.emmet_ls.setup({
            --	-- on_attach = on_attach,
            --	capabilities = capabilities,
            --	filetypes = {
            --		"css",
            --		"eruby",
            --		"html",
            --		"javascript",
            --		"javascriptreact",
            --		"less",
            --		"sass",
            --		"typescript",
            --		"scss",
            --		"svelte",
            --		"pug",
            --		"typescriptreact",
            --		"vue",
            --	},
            --	init_options = {
            --		html = {
            --			options = {
            --				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            --				["bem.enabled"] = true,
            --			},
            --		},
            --	},
            --})

            -- local css_capabilities = vim.lsp.protocol.make_client_capabilities()
            -- css_capabilities.textDocument.completion.completionItem.snippetSupport = true
            -- lspconfig.cssls.setup({
            -- 	capabilities = css_capabilities,
            -- 	single_file_support = true
            -- })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
