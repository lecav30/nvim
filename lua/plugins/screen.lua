---------------------------------------------------------------------------------
----------------------------------- Screen --------------------------------------
---------------------------------------------------------------------------------
return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
	}, -- Screen start
	--[[ {
		"willothy/nvim-cokeline",
		dependencies = {
			"stevearc/resession.nvim",
		},
		config = true,
	}, -- Buffer line ]]
	"nvim-lualine/lualine.nvim", -- Statusline
	{
		"numToStr/Comment.nvim",
		lazy = false,
	}, -- Better comments for neovim
}
