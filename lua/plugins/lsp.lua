return {
	---------------------------------------------------------------------------------
	------------------------------ LSP / CMP Snippets -------------------------------
	---------------------------------------------------------------------------------
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp", -- Completion engine
	"hrsh7th/cmp-nvim-lsp", -- Snippets LSP
	"hrsh7th/cmp-buffer", -- Buffer Snippets
	"hrsh7th/cmp-path", -- Path Snippets
	"hrsh7th/cmp-cmdline", -- Cmdline Snippets
	"hrsh7th/cmp-vsnip", -- Nvim-cmp  for vim-vsnip
	"L3MON4D3/LuaSnip", -- Snippets
	"saadparwaiz1/cmp_luasnip", -- Snippets with cmp
	"rafamadriz/friendly-snippets", -- Friendly snippets
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
