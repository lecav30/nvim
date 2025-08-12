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
