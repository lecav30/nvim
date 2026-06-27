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
		keys = {
			{
				"<leader>ca",
				function()
					vim.lsp.buf.code_action()
				end,
				desc = "Code Action",
			},
			{
				"<leader>gd",
				function()
					vim.lsp.buf.declaration()
				end,
				desc = "Go to Declaration",
			},
			{
				"<leader>gD",
				function()
					vim.lsp.buf.definition()
				end,
				desc = "Go to Definition",
			},
			{
				"<leader>k",
				function()
					vim.lsp.buf.hover()
				end,
				desc = "Hover Documentation",
			},
			{
				"<leader>rn",
				function()
					vim.lsp.buf.rename()
				end,
				desc = "Rename Symbol",
			},
		},
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostics" },
			{ "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
			{ "<leader>xd", "<cmd>Trouble lsp_definitions toggle<cr>", desc = "Definitions" },
			{ "<leader>xD", "<cmd>Trouble lsp_declarations toggle<cr>", desc = "Declarations" },
			{ "<leader>xi", "<cmd>Trouble lsp_incoming_calls toggle<cr>", desc = "Incoming Calls" },
			{ "<leader>xl", "<cmd>Trouble lsp toggle<cr>", desc = "LSP Definitions / References" },
			{ "<leader>xm", "<cmd>Trouble lsp_implementations toggle<cr>", desc = "Implementations" },
			{ "<leader>xo", "<cmd>Trouble lsp_outgoing_calls toggle<cr>", desc = "Outgoing Calls" },
			{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
			{ "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", desc = "References" },
			{ "<leader>xs", "<cmd>Trouble symbols toggle focus=true<cr>", desc = "Document Symbols" },
			{ "<leader>xt", "<cmd>Trouble lsp_type_definitions toggle<cr>", desc = "Type Definitions" },
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
		},
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
