return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-neorg/neorg-telescope" },
    },
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.integrations.telescope"] = {},
                ["core.dirman"] = {

                    config = {
                        workspaces = {
                            notes = "~/neorg_workspaces/notes",
                            estudos = "~/neorg_workspaces/estudos",
                            audio_platform = "~/neorg_workspaces/audio_platform_app",
                        },
                        default_workspace = "default",
                    },
                },
            },
        })

        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2

        vim.keymap.set(
            "n",
            "<leader>no",
            "<cmd>Telescope neorg find_norg_files<cr>"
        )
        vim.keymap.set(
            "n",
            "<leader>nw",
            "<cmd>Telescope neorg switch_workspace<cr>"
        )
    end,
}
