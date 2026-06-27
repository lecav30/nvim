---------------------------------------------------------------------------------
----------------------------------- Screen --------------------------------------
---------------------------------------------------------------------------------
return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VimEnter",
		keys = {
			{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
		},
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
