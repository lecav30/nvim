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
	------------------------------------- Rust --------------------------------------
	---------------------------------------------------------------------------------
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
		ft = "rust",
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = false,
					},
				},
			})
		end,
	}, -- Manage crates dependencies
	---------------------------------------------------------------------------------
	----------------------------------- Markdown ------------------------------------
	---------------------------------------------------------------------------------
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
}
