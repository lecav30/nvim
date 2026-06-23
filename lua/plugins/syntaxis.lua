return {
	---------------------------------------------------------------------------------
	------------------------------------- Format ------------------------------------
	---------------------------------------------------------------------------------
	{
		"stevearc/conform.nvim",
		opts = {},
	}, -- Format
	---------------------------------------------------------------------------------
	--------------------------------- Indent, color ---------------------------------
	---------------------------------------------------------------------------------
	{ "nvim-mini/mini.indentscope", version = "*", opts = {} }, -- Indentation guides
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins_settings.treesitter")
		end,
		opts_extend = { "ensure_installed" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			{
				"windwp/nvim-ts-autotag",
				opts = {},
			}, -- Rename
			"nvim-treesitter/nvim-treesitter-textobjects",
		}, -- Comments for tsx and jsx
	}, -- Treesitter (Highlighting)
	---------------------------------------------------------------------------------
	------------------------------------- HTML --------------------------------------
	---------------------------------------------------------------------------------
	{
		"norcalli/nvim-colorizer.lua",
		opts = {},
	}, -- Colorizer
}
