return {
	---------------------------------------------------------------------------------
	-------------------------- LSP / Completation Snippets ----------------------------
	---------------------------------------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			focus = true,
			-- win = {
			-- 	type = "float",
			-- 	relative = "editor",
			-- 	position = { 0.5, 0.5 },
			-- 	size = { width = 0.9, height = 0.85 },
			-- 	border = "rounded",
			-- 	title = " Trouble ",
			-- 	title_pos = "center",
			-- },
		},
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			{ "mlaursen/vim-react-snippets", opts = {} }, -- React snippets
		},
	}, -- Snippets
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			{
				"supermaven-inc/supermaven-nvim",
				opts = {
					disable_inline_completion = true,
					disable_keymaps = true,
					log_level = "off", -- suppress print() warnings before noice is active
				},
			},
			"rafamadriz/friendly-snippets",
			"huijiro/blink-cmp-supermaven",
			"mlaursen/vim-react-snippets",
		},
	},
	---------------------------------------------------------------------------------
	----------------------------------- Mason ---------------------------------------
	---------------------------------------------------------------------------------
	"williamboman/mason.nvim",
	---------------------------------------------------------------------------------
	---------------------------------- Status ---------------------------------------
	---------------------------------------------------------------------------------
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
}
