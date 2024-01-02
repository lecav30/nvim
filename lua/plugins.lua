local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key to space
vim.g.mapleader = " "

require("lazy").setup({
	"lewis6991/impatient.nvim", -- Better time loading lua modules
	---------------------------------------------------------------------------------
	----------------------------------- Themes --------------------------------------
	---------------------------------------------------------------------------------
	"bluz71/vim-moonfly-colors", -- Moonfly theme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- catppuccin theme
	"overcache/NeoSolarized", -- NeoSolarized theme
	-- "shaunsingh/nord.nvim", -- Nord theme
	-- "luisiacc/gruvbox-baby", -- Gruvbox baby theme
	-- "sainnhe/sonokai", -- Sonokai theme
	-- "jacoborus/tender.vim", -- Tender theme
	---------------------------------------------------------------------------------
	----------------------------- Indent, color, icons ------------------------------
	---------------------------------------------------------------------------------
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- Indentation guides
	"p00f/nvim-ts-rainbow", -- Rainbow brackets
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		}, -- Comments for tsx and jsx
	}, -- Treesitter (Highlighting)
	"nvim-tree/nvim-web-devicons", -- Icons for nerd fonts
	---------------------------------------------------------------------------------
	------------------------------- File explorer -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		name = "telescope",
	}, -- Telescope
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim",
		},
	}, -- Better Tree
	-- {
	-- 	"ldelossa/nvim-ide",
	-- }, -- IDE views
	---------------------------------------------------------------------------------
	------------------------------ LSP / CMP Snippets -------------------------------
	---------------------------------------------------------------------------------
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp", -- Snippets LSP
	"hrsh7th/cmp-buffer", -- Buffer Snippets
	"hrsh7th/cmp-path", -- Path Snippets
	"hrsh7th/cmp-cmdline", -- Cmdline Snippets
	"hrsh7th/nvim-cmp", -- Completion engine
	"L3MON4D3/LuaSnip", -- Snippets
	"saadparwaiz1/cmp_luasnip", -- Snippets with cmp
	"rafamadriz/friendly-snippets", -- Friendly snippets
	---------------------------------------------------------------------------------
	---------------------------- Better performance LSP -----------------------------
	---------------------------------------------------------------------------------
	"onsails/lspkind.nvim", -- Icons
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	}, -- UI
	---------------------------------------------------------------------------------
	----------------------------------- Mason ---------------------------------------
	---------------------------------------------------------------------------------
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	---------------------------------------------------------------------------------
	----------------------------------- Null-LS -------------------------------------
	---------------------------------------------------------------------------------
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	---------------------------------------------------------------------------------
	------------------------------------ Git ----------------------------------------
	---------------------------------------------------------------------------------
	"lewis6991/gitsigns.nvim", -- Git signs
	{
		"wintermute-cell/gitignore.nvim", -- Gitignore
		dependencies = { "nvim-telescope/telescope.nvim" }, -- optional: for multi-select
	},
	---------------------------------------------------------------------------------
	----------------------------------- Screen --------------------------------------
	---------------------------------------------------------------------------------
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").opts)
		end,
	}, -- Start
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
		},
		config = true,
	}, -- Bufferline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	}, -- Lualine
	-- "Bekaboo/dropbar.nvim", -- BreadCrumb ONLY WORKING in Neovim Nightly
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
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
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	---------------------------------------------------------------------------------
	---------------------------------- Extras ---------------------------------------
	---------------------------------------------------------------------------------
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	}, -- Which key
	"lervag/vimtex", -- Latex
	"github/copilot.vim", -- Github copilot
	"norcalli/nvim-colorizer.lua", -- Colorizer
	"RRethy/vim-illuminate", -- Highlight word under cursor
	"eandrju/cellular-automaton.nvim", -- This is just fun
})
