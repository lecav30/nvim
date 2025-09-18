return {
	---------------------------------------------------------------------------------
	------------------------------- File explorer -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim", -- File browser
		},
	}, -- Telescope [Gitignore, NeoClip]
	"keyvchan/telescope-find-pickers.nvim", -- Telescope picker
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},
	---------------------------------------------------------------------------------
	------------------------------- Search engine -----------------------------------
	---------------------------------------------------------------------------------
	"MagicDuck/grug-far.nvim", -- Search and replace
}
