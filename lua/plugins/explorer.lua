return {
	---------------------------------------------------------------------------------
	------------------------------- File explorer -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
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
		opts = {
			debug = {
				enabled = true,
				show_scores = true,
			},
		},
		lazy = false, -- the plugin lazy-initialises itself
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},
	---------------------------------------------------------------------------------
	------------------------------- Search engine -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
