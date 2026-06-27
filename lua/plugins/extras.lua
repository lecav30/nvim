return {
	---------------------------------------------------------------------------------
	---------------------------------- Extras ---------------------------------------
	---------------------------------------------------------------------------------
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("plugins_settings.which-key")
		end,
		event = "VeryLazy",
	}, -- Which key
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	}, -- Surrounding delimiter pairs
	{ "echasnovski/mini.bufremove", version = "*", lazy = true }, -- Delete buffer
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		opts = {
			override = {
				zsh = {
					icon = "",
					color = "#428850",
					name = "Zsh",
				},
			},
			default = true,
		},
	},
}
