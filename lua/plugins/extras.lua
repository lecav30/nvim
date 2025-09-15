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
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	}, -- Which key
	-- "RRethy/vim-illuminate", -- Highlight word under cursor
	"eandrju/cellular-automaton.nvim", -- This is just fun
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = { "kkharji/sqlite.lua", module = "sqlite" },
		config = function()
			require("neoclip").setup()
		end,
	}, -- Clipboard
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
