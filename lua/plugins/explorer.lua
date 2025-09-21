return {
	---------------------------------------------------------------------------------
	------------------------------- File explorer -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim", -- File browser
			"nvim-lua/plenary.nvim", -- required
			"nvim-tree/nvim-web-devicons", -- Icons for nerd fonts
		},
	}, -- Telescope
	"keyvchan/telescope-find-pickers.nvim", -- Telescope picker
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
