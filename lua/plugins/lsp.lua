return {
	---------------------------------------------------------------------------------
	-------------------------- LSP / Completation Snippets ----------------------------
	---------------------------------------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"saghen/blink.cmp",
			"williamboman/mason.nvim",
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				opts = {
					ensure_installed = {
						"css-lsp",
						"diagnostic-languageserver",
						"emmet-ls",
						"html-lsp",
						"lua-language-server",
						"prettier",
						"prettierd",
						"stylua",
						"tailwindcss-language-server",
						"typescript-language-server",
					},
					auto_update = false,
					run_on_start = true,
					start_delay = 3000,
					debounce_hours = 24,
				},
			},
		},
		config = function()
			require("lsp.lsp")
		end,
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
		config = function()
			require("plugins_settings.blink")
		end,
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
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
			PATH = "prepend",
		},
	},
	---------------------------------------------------------------------------------
	---------------------------------- Status ---------------------------------------
	---------------------------------------------------------------------------------
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {},
	},
}
