---------------------------------------------------------------------------------
------------------------------- File explorer -----------------------------------
---------------------------------------------------------------------------------
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim", -- File browser
		},
	}, -- Telescope [Gitignore, NeoClip]
	"keyvchan/telescope-find-pickers.nvim", -- Telescope picker
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
	}, -- Better Tree
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
	}, -- File explorer
}
