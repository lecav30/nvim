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
		lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
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
