---------------------------------------------------------------------------------
----------------------------------- Themes --------------------------------------
---------------------------------------------------------------------------------
return {
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 }, -- Moonfly theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
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
	"overcache/NeoSolarized", -- NeoSolarized theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	}, -- Tokyonight theme
	"shaunsingh/nord.nvim", -- Nord theme
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... }, -- Gruvbox theme
	{
		"fynnfluegge/monet.nvim",
		name = "monet",
	}, -- Monet theme
}
