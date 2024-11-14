return {
    -- "shaunsingh/solarized.nvim",
    "catppuccin/nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("catppuccin-latte")
    end,
}
