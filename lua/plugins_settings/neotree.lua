require("neo-tree").setup({
	close_if_last_window = false,
	popup_border_style = "rounded",
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
	sort_case_insensitive = true,
	source_selector = {
		winbar = true,
	},
	sources = {
		"filesystem",
		"buffers",
		"git_status",
		"document_symbols",
	},
	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
		diagnostics = {
			symbols = {
				hint = "",
				info = "",
				warn = "",
				error = "",
			},
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			default = "*",
			highlight = "NeoTreeFileIcon",
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				added = "✚",
				modified = "",
				deleted = "✖",
				renamed = "󰁕",
				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
			},
		},
	},
	window = {
		mappings = {
			["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
		},
	},
})
