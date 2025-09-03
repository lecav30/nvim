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
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" }, -- Indentation guides
	"p00f/nvim-ts-rainbow", -- Rainbow brackets
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
		opts_extend = { "ensure_installed" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-textobjects",
		}, -- Comments for tsx and jsx
	}, -- Treesitter (Highlighting) [LSPSaga]
	-- {
	-- 	"echasnovski/mini.icons",
	-- 	opts = {},
	-- 	lazy = true,
	-- 	specs = {
	-- 		{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
	-- 	},
	-- 	init = function()
	-- 		package.preload["nvim-web-devicons"] = function()
	-- 			-- needed since it will be false when loading and mini will fail
	-- 			package.loaded["nvim-web-devicons"] = {}
	-- 			require("mini.icons").mock_nvim_web_devicons()
	-- 			return package.loaded["nvim-web-devicons"]
	-- 		end
	-- 	end,
	-- },
	---------------------------------------------------------------------------------
	------------------------------------ Latex --------------------------------------
	---------------------------------------------------------------------------------
	"lervag/vimtex", -- Latex
	---------------------------------------------------------------------------------
	------------------------------------- HTML --------------------------------------
	---------------------------------------------------------------------------------
	"alvan/vim-closetag", -- Close
	"AndrewRadev/tagalong.vim", -- Rename
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	}, -- Colorizer
	---------------------------------------------------------------------------------
	---------------------------------- TypeScript -----------------------------------
	---------------------------------------------------------------------------------
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	---------------------------------------------------------------------------------
	----------------------------------- Markdown ------------------------------------
	---------------------------------------------------------------------------------
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	},
	---------------------------------------------------------------------------------
	-------------------------------------- ORG --------------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
	},
	"akinsho/org-bullets.nvim",
	"danilshvalov/org-modern.nvim",
}
