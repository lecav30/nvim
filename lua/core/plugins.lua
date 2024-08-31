local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key to space
vim.g.mapleader = " "

require("lazy").setup({
	checker = { enabled = true }, -- automatically check for plugin updates
	---------------------------------------------------------------------------------
	----------------------------------- Themes --------------------------------------
	---------------------------------------------------------------------------------
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 }, -- Moonfly theme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- Catppuccin theme
	"overcache/NeoSolarized", -- NeoSolarized theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	}, -- Tokyonight theme
	"shaunsingh/nord.nvim", -- Nord theme
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
	-------------------------------- Dependencies -----------------------------------
	---------------------------------------------------------------------------------
	"nvim-lua/plenary.nvim", -- [Telescope, NullLS, Cokeline, Hardtime]
	"MunifTanjim/nui.nvim", -- UI Component Library for Neovim. [Hardtime, Neotree]plugin
	"nvim-tree/nvim-web-devicons", -- Icons for nerd fonts [Telescope, Dashboard, Cokeline, Lualine]
	---------------------------------------------------------------------------------
	------------------------------- File explorer -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim", -- File browser
		},
	}, -- Telescope [Gitignore, NeoClip]
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- }, -- Better Tree
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
	}, -- File explorer
	---------------------------------------------------------------------------------
	------------------------------ LSP / CMP Snippets -------------------------------
	---------------------------------------------------------------------------------
	"neovim/nvim-lspconfig",
	"keyvchan/telescope-find-pickers.nvim", -- Telescope picker
	"hrsh7th/nvim-cmp", -- Completion engine
	"hrsh7th/cmp-nvim-lsp", -- Snippets LSP
	"hrsh7th/cmp-buffer", -- Buffer Snippets
	"hrsh7th/cmp-path", -- Path Snippets
	"hrsh7th/cmp-cmdline", -- Cmdline Snippets
	"hrsh7th/cmp-vsnip", -- Nvim-cmp  for vim-vsnip
	"L3MON4D3/LuaSnip", -- Snippets
	"saadparwaiz1/cmp_luasnip", -- Snippets with cmp
	"rafamadriz/friendly-snippets", -- Friendly snippets
	---------------------------------------------------------------------------------
	---------------------------- Better performance LSP -----------------------------
	---------------------------------------------------------------------------------
	"onsails/lspkind.nvim", -- Icons for LSP
	"nvimdev/lspsaga.nvim", -- UI
	---------------------------------------------------------------------------------
	----------------------------------- Mason ---------------------------------------
	---------------------------------------------------------------------------------
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	---------------------------------------------------------------------------------
	----------------------------------- Null-LS -------------------------------------
	---------------------------------------------------------------------------------
	"jose-elias-alvarez/null-ls.nvim",
	---------------------------------------------------------------------------------
	------------------------------------ Git ----------------------------------------
	---------------------------------------------------------------------------------
	"lewis6991/gitsigns.nvim", -- Git signs
	"wintermute-cell/gitignore.nvim", -- Gitignore
	---------------------------------------------------------------------------------
	----------------------------------- Debug ---------------------------------------
	---------------------------------------------------------------------------------
	"mfussenegger/nvim-dap", -- DAP
	"theHamsta/nvim-dap-virtual-text", -- DAP Virtual Text
	{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } }, -- DAP UI
	"jay-babu/mason-nvim-dap.nvim", -- Mason DAP
	---------------------------------------------------------------------------------
	----------------------------------- Screen --------------------------------------
	---------------------------------------------------------------------------------
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
	}, -- Buufer line ]]
	"nvim-lualine/lualine.nvim", -- Statusline
	{
		"numToStr/Comment.nvim",
		lazy = false,
	}, -- Better comments for neovim
	---------------------------------------------------------------------------------
	--------------------------------- HTML tag --------------------------------------
	---------------------------------------------------------------------------------
	"alvan/vim-closetag", -- Close
	"AndrewRadev/tagalong.vim", -- Rename
	---------------------------------------------------------------------------------
	-------------------------------- VimFeatures ------------------------------------
	---------------------------------------------------------------------------------
	"windwp/nvim-autopairs", -- Autopairs
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" }, -- Fold
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-notify",
		},
	}, -- Notifications
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
	"lervag/vimtex", -- Latex
	"github/copilot.vim", -- Github copilot
	"norcalli/nvim-colorizer.lua", -- Colorizer
	"RRethy/vim-illuminate", -- Highlight word under cursor
	"eandrju/cellular-automaton.nvim", -- This is just fun
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = { "kkharji/sqlite.lua", module = "sqlite" },
	}, -- Clipboard
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		dependencies = {
			"folke/trouble.nvim",
		},
	}, -- ChatGPT
	---------------------------------------------------------------------------------
	---------------------------------- Smooth----------------------------------------
	---------------------------------------------------------------------------------
	"nacro90/numb.nvim", -- Peek lines
	"gen740/SmoothCursor.nvim", -- Smooth cursor
	---------------------------------------------------------------------------------
	------------------------------------ Zen ----------------------------------------
	---------------------------------------------------------------------------------
	"folke/zen-mode.nvim", -- Zen mode
	"folke/twilight.nvim", -- Twilight
})
