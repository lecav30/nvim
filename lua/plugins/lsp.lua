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
					disable_inline_completion = true, -- disables inline completion for use with cmp
					disable_keymaps = true, -- disables built in keymaps for more manual control
				},
			},
			"rafamadriz/friendly-snippets",
			"huijiro/blink-cmp-supermaven",
			"mlaursen/vim-react-snippets",
		},
	},
  ---------------------------------------------------------------------------------
	---------------------------- Better performance LSP -----------------------------
	---------------------------------------------------------------------------------
	"onsails/lspkind.nvim", -- Icons for LSP
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
