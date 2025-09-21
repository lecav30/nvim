return {
	---------------------------------------------------------------------------------
	-------------------------- LSP / Completation Snippets ----------------------------
	---------------------------------------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	}, -- Snippets
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				"supermaven-inc/supermaven-nvim",
				opts = {
					disable_inline_completion = true, -- disables inline completion for use with cmp
					disable_keymaps = true, -- disables built in keymaps for more manual control
				},
			},
			"huijiro/blink-cmp-supermaven",
			"mlaursen/vim-react-snippets",
		},
	},
	{
		"mlaursen/vim-react-snippets",
		dependencies = { "L3MON4D3/LuaSnip" },
		config = function()
			require("vim-react-snippets").lazy_load()
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
	---------------------------------- Status ---------------------------------------
	---------------------------------------------------------------------------------
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
}
