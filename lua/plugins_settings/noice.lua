require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		progress = { enabled = true },
		hover = { enabled = true },
		signature = { enabled = true },
		message = { enabled = true },
	},
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
	-- filters
	routes = {
		{
			filter = {
				event = "notify",
				find = "No information available",
			},
			opts = { skip = true },
		},
		{
			filter = {
				any = {
					{ event = "notify", find = "nvim%-cmp is not available" },
					{ event = "msg_show", find = "nvim%-cmp is not available" },
				},
			},
			opts = { skip = true },
		},
		{
			filter = {
				any = {
					{ event = "notify", find = "tbl_flatten" },
					{ event = "msg_show", find = "tbl_flatten" },
				},
			},
			opts = { skip = true },
		},
	},
	top_down = false,
})

require("notify").setup({
	-- Posición de las notificaciones
	render = "wrapped-compact", -- "default" "minimal" "simple" "wrapped-compact"
	top_down = false,
	background_colour = "#000000",
})
