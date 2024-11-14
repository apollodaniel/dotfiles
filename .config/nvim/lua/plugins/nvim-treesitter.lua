return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })

            -- folding
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

            -- vim.opt.foldcolumn = "0"
            vim.opt.foldtext = ""

            -- vim.opt.foldlevel = 99
            -- vim.opt.foldlevelstart = 1

            -- vim.opt.foldnestmax = 1
        end,
    },
}
