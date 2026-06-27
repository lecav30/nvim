---------------------------------------------------------------------------------
----------------------------------- Themes --------------------------------------
---------------------------------------------------------------------------------
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		opts = {
			transparent_background = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				notify = true,
				dashboard = true,
				indent_blankline = {
					enabled = true,
					scope_color = "mocha",
					colored_indent_levels = false,
				},
				mason = true,
				neotree = true,
				noice = true,
				dap = true,
				dap_ui = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				telescope = {
					enabled = true,
				},
				which_key = true,
			},
		},
	}, -- Catppuccin theme
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"jacoborus/tender.vim",
		lazy = true,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = true,
	},
}
