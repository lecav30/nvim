---------------------------------------------------------------------------------
----------------------------------- Screen --------------------------------------
---------------------------------------------------------------------------------
return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	}, -- Screen start
	{ "akinsho/bufferline.nvim", version = "*" }, -- Buffer line
	{ "rebelot/heirline.nvim" }, -- Statusline
	{
		"numToStr/Comment.nvim",
		lazy = false,
	}, -- Better comments for neovim
}
