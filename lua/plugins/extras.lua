return {
	---------------------------------------------------------------------------------
	---------------------------------- Extras ---------------------------------------
	---------------------------------------------------------------------------------
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		event = "VeryLazy",
	}, -- Which key
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
	}, -- Surrounding delimiter pairs
	{ "echasnovski/mini.bufremove", version = "*" }, -- Delete buffer
	---------------------------------------------------------------------------------
	------------------------------------ IA -----------------------------------------
	---------------------------------------------------------------------------------
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	}, -- Supermaven
}
