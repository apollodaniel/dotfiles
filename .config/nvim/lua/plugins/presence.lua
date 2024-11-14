return {
	"mistweaverco/discord.nvim",
	event = "VeryLazy",
	config = function()
		-- The setup config table shows all available config options with their default values:
		require("discord").setup({
			-- General options
			auto_connect = true, -- Automatically connect to Discord RPC
			logo = "auto", -- "auto" or url
			logo_tooltip = nil, -- nil or string
			main_image = "language", -- "language" or "logo"
			client_id = "1233867420330889286", -- Use your own Discord application client id (not recommended)
			log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
			debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
			blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
			file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
			show_time = true, -- Show the timer
			global_timer = true, -- if set false, timer will be reset on aucmds

			-- Rich Presence text options
			editing_text = "Editando %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
			file_explorer_text = "Navegando %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
			git_commit_text = "Commitando as mudanças", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
			plugin_manager_text = "Gerenciando plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
			reading_text = "Lendo %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
			workspace_text = "Trabalhando em %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
			line_number_text = "Linha %s de %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			terminal_text = "Usando o terminal", -- Format string rendered when in terminal mode.
		})
	end,
}