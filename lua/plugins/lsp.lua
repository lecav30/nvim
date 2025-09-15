return {
	---------------------------------------------------------------------------------
	-------------------------- LSP / Completation Snippets ----------------------------
	---------------------------------------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
	},
	"L3MON4D3/LuaSnip", -- Snippets
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"mlaursen/vim-react-snippets",
		dependencies = { "L3MON4D3/LuaSnip" },
		config = function()
			require("vim-react-snippets").lazy_load()

			local config = require("vim-react-snippets.config")
			-- config.readonly_props = false -- Si no quieres envolver props como Readonly<T>
			-- config.test_framework = "vitest" -- Para usar Vitest en tus tests
			-- config.test_renderer_path = "@/test-utils" -- Para personalizar el path del renderer
		end,
	}, -- React snippets
	---------------------------------------------------------------------------------
	---------------------------- Better performance LSP -----------------------------
	---------------------------------------------------------------------------------
	"onsails/lspkind.nvim", -- Icons for LSP
	"nvimdev/lspsaga.nvim", -- UI
	---------------------------------------------------------------------------------
	----------------------------------- Mason ---------------------------------------
	---------------------------------------------------------------------------------
	"williamboman/mason.nvim",
	-- "williamboman/mason-lspconfig.nvim", -- Install LSP servers and provide configurations
	-- It's not strictly necessary, but it's usefull if you want to use the LSP servers
	-- that are installed by Mason without worrying about the configurations.
	---------------------------------------------------------------------------------
	----------------------------------- Utility -------------------------------------
	---------------------------------------------------------------------------------
	"nvim-lua/lsp-status.nvim",
}
