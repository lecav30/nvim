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
	"lukas-reineke/indent-blankline.nvim", -- Indentation guides
	"p00f/nvim-ts-rainbow", -- Rainbow brackets
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	}, -- Treesitter (Highlighting)
	"nvim-tree/nvim-web-devicons", -- Icons for nerd fonts
	---------------------------------------------------------------------------------
	------------------------------- File explorer -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	}, -- Telescope
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	}, -- Tree
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
	"tami5/lspsaga.nvim", -- UI
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
	"terrortylor/nvim-comment", -- Better comments for neovim
	---------------------------------------------------------------------------------
	--------------------------------- HTML tag --------------------------------------
	---------------------------------------------------------------------------------
	"alvan/vim-closetag", -- Close
	"AndrewRadev/tagalong.vim", -- Rename
	---------------------------------------------------------------------------------
	---------------------------------- Extras ---------------------------------------
	---------------------------------------------------------------------------------
	{ "akinsho/toggleterm.nvim", version = "*", config = true }, -- Toggle Term
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
	"windwp/nvim-autopairs", -- Autopairs
})
