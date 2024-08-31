require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		-- Square
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		--
		-- Circle
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		--
		-- Triangle
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypese = { "packer" },
		always_divide_middle = true,
		symbols = {
			added = "+",
			modified = "~",
			removed = "-",
			unix = "",
			dos = "",
			mac = "",
			error = " ",
			warn = " ",
			info = " ",
			hint = " ",
		},
		colored = true,
		source = nil,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "buffers" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "nvim_lsp" },
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					error = "DiagnosticError",
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
				},
				update_in_insert = false,
				always_visible = false,
			},
			"require'lsp-status'.status()",
		},
		lualine_z = {
			"branch",
			{
				"diff",
				diff_color = {
					added = "DiffAdd",
					modified = "DiffChange",
					removed = "DiffDelete",
				},
			},
		},
	},
	inactive_sections = {
		lualine_b = {},
		lualine_a = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = { "progress" },
		lualine_z = { "os.date('%F')", "location" },
	},
	extensions = { "neo-tree", "mason", "lazy", "nvim-dap-ui" }, -- nvim-tree
})
