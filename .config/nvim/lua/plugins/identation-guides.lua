return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    --enabled = true,
    ---@module "ibl"
    ---@type ibl.config
    config = function()
        -- For init.lua
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }
        local hooks = require("ibl.hooks")
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#3f0d12" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        end)

        vim.g.rainbow_delimiters = { highlight = highlight }
        require("ibl").setup({
            -- scope = { highlight = highlight },
            indent = {
                highlight = highlight,
            },
        })

        hooks.register(
            hooks.type.SCOPE_HIGHLIGHT,
            hooks.builtin.scope_highlight_from_extmark
        )
        hooks.register(
            hooks.type.WHITESPACE,
            hooks.builtin.hide_first_space_indent_level
        )
    end,
}

-- require("ibl").setup({
--     exclude = {
--         buftypes = { "Terminal" },
--         filetypes = { "help", "dashboard", "NvimTree", "Markdown" },
--     },
--     --     scope = {
--     --         char = "╏",
--     --     },
--     --     indent = {
--     --         smart_indent_cap = true,
--     --         char = "╎", -- You can change this to any character you prefer
--     --     },
-- })
