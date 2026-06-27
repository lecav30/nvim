return {
	---------------------------------------------------------------------------------
	------------------------------- File explorer -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		cmd = "Telescope",
		config = function()
			require("plugins_settings.telescope")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-tree/nvim-web-devicons", -- Icons for nerd fonts
		},
	}, -- Telescope
	{
		"dmtrKovalenko/fff.nvim",
		build = function()
			require("fff.download").download_or_build_binary()
		end,
		opts = {},
		lazy = false, -- the plugin lazy-initialises itself
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Oil",
		opts = {},
	},
	---------------------------------------------------------------------------------
	------------------------------- Search engine -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Spectre",
		opts = {},
	},
}
