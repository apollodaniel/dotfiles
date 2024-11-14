vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.editorconfig = true
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("set nowrap")
vim.cmd("set guitablabel=%t")
vim.cmd("set splitright")
vim.cmd("set showtabline=0")
vim.cmd("set guifont=Hack\\ Nerd\\ Font:h16")

-- setup color theme
vim.cmd.colorscheme("Monokai-Charcoal")
vim.opt.background = "dark"

-- recognize .inc files as filetype nasm
vim.cmd("autocmd BufNewFile,BufRead *.inc :set filetype=nasm")
-- .rasi files recognize
vim.cmd("autocmd BufNewFile,BufRead *.rasi :set filetype=rasi")

vim.opt.termguicolors = true -- Enable true color support in Neovim

-- set terminal color to match theme
vim.g.terminal_color_background = "#000000" -- Background -> black from [colors.primary]
vim.g.terminal_color_foreground = "#FFFFFF" -- Foreground -> white from [colors.primary]

-- Normal colors
vim.g.terminal_color_0 = "#1a1a1a" -- black
vim.g.terminal_color_1 = "#f4005f" -- red
vim.g.terminal_color_2 = "#98e024" -- green
vim.g.terminal_color_3 = "#fa8419" -- yellow
vim.g.terminal_color_4 = "#9d65ff" -- blue
vim.g.terminal_color_5 = "#f4005f" -- magenta
vim.g.terminal_color_6 = "#58d1eb" -- cyan
vim.g.terminal_color_7 = "#c4c5b5" -- white

-- Bright colors
vim.g.terminal_color_8 = "#625e4c" -- bright black
vim.g.terminal_color_9 = "#f4005f" -- bright red
vim.g.terminal_color_10 = "#98e024" -- bright green
vim.g.terminal_color_11 = "#e0d561" -- bright yellow
vim.g.terminal_color_12 = "#9d65ff" -- bright blue
vim.g.terminal_color_13 = "#f4005f" -- bright magenta
vim.g.terminal_color_14 = "#58d1eb" -- bright cyan
vim.g.terminal_color_15 = "#f6f6ef" -- bright white

-- disable aditional space on screen bottom by removind cmd default height
vim.opt.cmdheight = 0

-- disable arrow keys no normal and insert mode

vim.api.nvim_set_keymap("n", "<Up>", "<NOP>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
    "n",
    "<leader>rn",
    ":set rnu!<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<Down>",
    "<NOP>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<Left>",
    "<NOP>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Right>",
    "<NOP>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap("i", "<Up>", "<NOP>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
    "i",
    "<Down>",
    "<NOP>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<Left>",
    "<NOP>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<Right>",
    "<NOP>",
    { noremap = true, silent = true }
)
--- end of disabling arrow keys

--- multi tabs
-- vim.api.nvim_set_keymap("n", "<leader>,", "<cmd>tabprevious<cr>", {})
-- vim.api.nvim_set_keymap("n", "<leader>.", "<cmd>tabnext<cr>", {})
--
-- vim.api.nvim_set_keymap("n", "<leader><s-a>", "<cmd>tabnew<cr>", {})
-- vim.api.nvim_set_keymap("n", "<leader><s-q>", "<cmd>tabclose<cr>", {})

vim.api.nvim_set_keymap(
    "n",
    "<A-v>",
    "<C-v>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "v",
    "<leader>y",
    '"+y',
    { noremap = true, silent = true }
)

vim.api.nvim_set_option("clipboard", "unnamedplus") -- add clipboard support

vim.api.nvim_set_keymap(
    "t",
    "<Esc>",
    "<C-\\><C-n>",
    { noremap = true, silent = true }
) -- exit terminal mode using esc
