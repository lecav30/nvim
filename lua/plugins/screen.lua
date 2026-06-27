---------------------------------------------------------------------------------
----------------------------------- Screen --------------------------------------
---------------------------------------------------------------------------------
return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VimEnter",
		config = function()
			require("plugins_settings.bufferline")
		end,
	}, -- Buffer line
	{
		"rebelot/heirline.nvim",
		lazy = false,
		config = function()
			require("plugins_settings.heirline")
		end,
	}, -- Statusline
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins_settings.comment")
		end,
	}, -- Better comments for neovim
}
