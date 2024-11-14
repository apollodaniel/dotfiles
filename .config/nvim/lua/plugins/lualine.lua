return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function tabline_tabs()
			local s = ""
			for index, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
				local winnr = vim.api.nvim_tabpage_get_win(tabnr)
				local bufnr = vim.api.nvim_win_get_buf(winnr)
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				local icon = require("nvim-web-devicons").get_icon(bufname, nil, { default = true })
				bufname = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
				-- Check if the tab is the current tab
				local is_active = tabnr == vim.api.nvim_get_current_tabpage()
				local hl = is_active and "%#TabLineSel#" or "%#TabLine#"

				-- Add tab number, icon, and name to the tabline string
				s = s .. string.format(" %s %d: %s %s ", hl, index, icon, vim.fn.fnamemodify(bufname, ":t"))

				-- Add a symbol if the buffer is modified
				if vim.api.nvim_buf_get_option(bufnr, "modified") then
					s = s .. "●"
				end

				s = s .. ""
			end
			return s
		end

		local ok, web_devicons = pcall(require, "nvim-web-devicons")
		if not ok then
			web_devicons = nil
		end

		local function is_valid_window(win)
			local buf = vim.api.nvim_win_get_buf(win)
			local buf_type = vim.api.nvim_buf_get_option(buf, "buftype")
			local buf_name = vim.api.nvim_buf_get_name(buf)

			-- Check for terminal buffers, new files, and valid file buffers
			return buf_type == "terminal" or buf_type == "" and (buf_name ~= "" and vim.fn.filereadable(buf_name) == 1)
		end

		local function get_current_tab_windows()
			local current_tab = vim.api.nvim_get_current_tabpage()
			local windows = vim.api.nvim_tabpage_list_wins(current_tab)
			local valid_windows = {}

			for _, win in ipairs(windows) do
				if is_valid_window(win) and not vim.tbl_contains(valid_windows, win) then
					table.insert(valid_windows, win)
				end
			end

			return valid_windows
		end

		function get_window_line()
			local ok, web_devicons = pcall(require, "nvim-web-devicons")
			if not ok then
				web_devicons = nil
			end

			local windows = get_current_tab_windows()
			local s = ""

			for _, win in ipairs(windows) do
				local buf = vim.api.nvim_win_get_buf(win)
				local buf_name = vim.api.nvim_buf_get_name(buf)
				local buf_ft = vim.api.nvim_buf_get_option(buf, "filetype")
				local buf_modified = vim.api.nvim_buf_get_option(buf, "modified")

				local filename = vim.fn.fnamemodify(buf_name, ":t")
				local icon = ""
				if web_devicons then
					icon = web_devicons.get_icon(filename, buf_ft, { default = true })
				end

				-- Modified indicator
				local modified_indicator = buf_modified and " ●" or ""

				-- Construct window segment
				s = s .. " " .. icon .. " " .. filename .. modified_indicator .. " |"
			end

			return s:sub(1, -2) -- Remove the trailing separator
		end

		local function get_current_tab_buffers()
			local current_tab = vim.api.nvim_get_current_tabpage()
			local windows = vim.api.nvim_tabpage_list_wins(current_tab)
			local buffers = {}

			for _, win in ipairs(windows) do
				local buf = vim.api.nvim_win_get_buf(win)
				if not vim.tbl_contains(buffers, buf) then
					table.insert(buffers, buf)
				end
			end

			return buffers
		end
		local function get_buffers()
			local buffers = get_current_tab_buffers()
			local s = ""

			for _, buf in ipairs(buffers) do
				local buf_name = vim.api.nvim_buf_get_name(buf)
				local buf_ft = vim.api.nvim_buf_get_option(buf, "filetype")
				local buf_modified = vim.api.nvim_buf_get_option(buf, "modified")

				local filename = vim.fn.fnamemodify(buf_name, ":t")
				local icon = ""
				if web_devicons then
					icon = web_devicons.get_icon(filename, buf_ft, { default = true })
				end

				-- Modified indicator
				local modified_indicator = buf_modified and " ●" or ""

				-- Construct buffer segment
				s = s .. " " .. icon .. " " .. filename .. modified_indicator .. " |"
			end

			return s:sub(1, -2) -- Remove the trailing separator
		end

		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true, -- E    section_separators = { left = '', right = '' }, -- Rounded separators
				component_separators = { left = "", right = "" }, -- Slim separatorsnable global statusline across all windows
				disabled_filetypes = { "NvimTree", "packer" },
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { tabline_tabs }, -- Combined tabs and filename
				lualine_x = { "filename"}, --"filetype", "fileformat"},
				lualine_y = { "diagnostics", "branch" },
				lualine_z = { "location", "mode" },
			},
			extensions = { "fugitive" }, -- Include your preferred extensions
		})

		-- require("lualine").setup({
		-- 	options = {
		-- 		theme = "auto",
		-- 		section_separators = "",
		-- 		component_separators = "",
		-- 	},
		-- 	sections = {
		-- 		lualine_a = { "mode" },
		-- 		lualine_b = {},
		-- 		lualine_c = { tabline_tabs }, -- Use the custom tabline function here
		-- 		lualine_x = { "filetype" },
		-- 		lualine_y = { "progress" },
		-- 		lualine_z = { "location" },
		-- 	},
		-- 	inactive_sections = {
		-- 		lualine_a = {},
		-- 		lualine_b = {},
		-- 		lualine_c = { tabline_tabs }, -- Use the custom tabline function here
		-- 		lualine_x = {},
		-- 		lualine_y = {},
		-- 		lualine_z = {},
		-- 	},
		-- 	extensions = { "fugitive" },
		-- })

		--require("lualine").setup({
		--	options = {
		--		icons_enabled = true,
		--		component_separators = "|",
		--		section_separators = "",
		--	},
		--	sections = {
		--		lualine_a = { "mode" },
		--		lualine_b = {},
		--		lualine_c = {
		--			{
		--				"buffers",
		--				show_filename_only = true, -- Only show the filename
		--				show_modified_status = true, -- Show if the buffer is modified
		--				mode = 2,  -- Show buffer number and name
		--				max_length = vim.o.columns * 2 / 3,
		--				buffers_color = {
		--					active = { fg = "#ffffff", bg = "#3b2b28" }, -- Color for active buffer
		--					inactive = { fg = "#a57572", bg = "#2b1f1d" }, -- Color for inactive buffers
		--				},
		--				symbols = {
		--					modified = " ●", -- Text to show when the buffer is modified
		--					alternate_file = "", -- Text to show to identify the alternate file
		--					directory = "", -- Text to show when the buffer is a directory
		--				},
		--			},
		--		},
		--		lualine_x = { "filetype" },
		--		lualine_y = { "progress" },
		--		lualine_z = { "location" },
		--	},
		--	inactive_sections = {
		--		lualine_a = {},
		--		lualine_b = {},
		--		lualine_c = {
		--			{
		--				"buffers",
		--				show_filename_only = true,
		--				show_modified_status = true,
		--				buffers_color = {
		--					active = { fg = "#ffffff", bg = "#3b2b28" },
		--					inactive = { fg = "#a57572", bg = "#2b1f1d" },
		--				},
		--				symbols = {
		--					modified = " ●",
		--					alternate_file = "",
		--					directory = "",
		--				},
		--			},
		--		},
		--		lualine_x = {},
		--		lualine_y = {},
		--		lualine_z = {},
		--	},
		--	extensions = { "fugitive" },
		--})
	end,
}
