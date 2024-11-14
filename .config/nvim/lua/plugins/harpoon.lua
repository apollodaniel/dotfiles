return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values

        local function toggle_telescope(harpoon_files)
            local file_paths = {}

            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            local make_finder = function()
                local paths = {}

                for _, item in ipairs(harpoon_files.items) do
                    table.insert(paths, item.value)
                end

                return require("telescope.finders").new_table({
                    results = paths,
                })
            end

            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = require("telescope.previewers").vim_buffer_cat.new({}),
                    sorter = conf.generic_sorter({}),
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_cutoff = 1,
                        width = function(_, max_columns, _)
                            return math.min(max_columns, 80)
                        end,
                        height = function(_, _, max_lines)
                            return math.min(max_lines, 30)
                        end,
                    },
                    -- borderchars = {
                    -- 	prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                    -- 	results = { "─", "│", "─", "│", "|", "|", "╯", "╰" },
                    -- 	preview = { "─", "│", "─", "│", "╭", "╮", "|", "|" },
                    -- },
                    attach_mappings = function(prompt_buffer_number, map)
                        -- The keymap you need
                        map("i", "<c-d>", function()
                            local state = require("telescope.actions.state")
                            local selected_entry = state.get_selected_entry()
                            local current_picker =
                                state.get_current_picker(prompt_buffer_number)

                            -- This is the line you need to remove the entry
                            harpoon:list():remove(selected_entry)
                            current_picker:refresh(make_finder())
                        end)

                        return true
                    end,
                })
                :find()
        end

        -- local conf = require("telescope.config").values
        -- local function toggle_telescope(harpoon_files)
        -- 	local file_paths = {}
        -- 	for _, item in ipairs(harpoon_files.items) do
        -- 		table.insert(file_paths, item.value)
        -- 	end
        --
        -- 	require("telescope.pickers")
        -- 		.new({}, {
        -- 			prompt_title = "Harpoon",
        -- 			finder = require("telescope.finders").new_table({
        -- 				results = file_paths,
        -- 			}),
        -- 			previewer = conf.file_previewer({}),
        -- 			sorter = conf.generic_sorter({}),
        -- 		})
        -- 		:find()
        -- end

        vim.keymap.set("n", "<leader>e", function()
            toggle_telescope(harpoon:list())
        end, { desc = "Open harpoon window" })

        -- keymaps
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", "<leader>d", function()
            harpoon:list():remove()
        end)

        -- vim.keymap.set("n", "<C-h>", function()
        -- 	harpoon:list():select(1)
        -- end)
        -- vim.keymap.set("n", "<C-t>", function()
        -- 	harpoon:list():select(2)
        -- end)
        -- vim.keymap.set("n", "<C-n>", function()
        -- 	harpoon:list():select(3)
        -- end)
        -- vim.keymap.set("n", "<C-s>", function()
        -- 	harpoon:list():select(4)
        -- end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader><S-P>", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "<leader><S-N>", function()
            harpoon:list():next()
        end)
    end,
}
