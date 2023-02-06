local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key to space
vim.g.mapleader = " "

require("lazy").setup(
    {
        "lewis6991/impatient.nvim", -- Better time loading lua modules
        ---------------------------------------------------------------------------------
        ----------------------------------- Themes --------------------------------------
        ---------------------------------------------------------------------------------
        "bluz71/vim-moonfly-colors", -- Moonfly theme
        "overcache/NeoSolarized", -- Solarized theme
        {"catppuccin/nvim", name = "catppuccin"}, -- Catppuccin theme
        ---------------------------------------------------------------------------------
        ----------------------------- Indent, color, icons ------------------------------
        ---------------------------------------------------------------------------------
        "lukas-reineke/indent-blankline.nvim", -- Indentation guides
        "p00f/nvim-ts-rainbow", -- Rainbow brackets
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate"
        }, -- Treesitter (Highlighting)
        "kyazdani42/nvim-web-devicons", -- Icons for nerd fonts
        ---------------------------------------------------------------------------------
        ----------------------------------- Format --------------------------------------
        ---------------------------------------------------------------------------------
        "sbdchd/neoformat", -- Format
        "windwp/nvim-autopairs", -- Autopairs
        ---------------------------------------------------------------------------------
        ------------------------------- File explorer -----------------------------------
        ---------------------------------------------------------------------------------
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {"nvim-lua/plenary.nvim"}
        }, -- Telescope
        {
            "kyazdani42/nvim-tree.lua",
            dependencies = {"kyazdani42/nvim-web-devicons"}
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
        -- COC to fronted
        -- {"neoclide/coc.nvim", branch = "release"}

        ---------------------------------------------------------------------------------
        ------------------------------------ Git ----------------------------------------
        ---------------------------------------------------------------------------------
        "lewis6991/gitsigns.nvim", -- Git signs
        {"TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim"}, -- Magit
        ---------------------------------------------------------------------------------
        ----------------------------------- Screen --------------------------------------
        ---------------------------------------------------------------------------------
        {
            "goolord/alpha-nvim",
            config = function()
                require "alpha".setup(require "alpha.themes.dashboard".opts)
            end
        }, -- Start
        {
            "noib3/nvim-cokeline",
            dependencies = "kyazdani42/nvim-web-devicons",
            config = function()
                require("cokeline").setup()
            end
        }, -- Bufferline
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {"kyazdani42/nvim-web-devicons", lazy = true}
        }, -- Lualine
        "terrortylor/nvim-comment", -- Better comments for neovim
        ---------------------------------------------------------------------------------
        --------------------------------- HTML tag --------------------------------------
        ---------------------------------------------------------------------------------
        "alvan/vim-closetag", -- Close
        "AndrewRadev/tagalong.vim", -- Rename
        ---------------------------------------------------------------------------------
        ---------------------------------- Extras ---------------------------------------
        ---------------------------------------------------------------------------------
        {
            "phaazon/hop.nvim",
            branch = "v2", -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
            end
        }, -- Easymotion
        {
            "akinsho/toggleterm.nvim",
            version = "*",
            config = function()
                require("toggleterm").setup()
            end
        }, -- Toggle Term
        {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup({})
            end
        }, -- Which key
        "lervag/vimtex", -- Latex
        "andweeb/presence.nvim", -- Discord presence
        "github/copilot.vim" -- Github copilot
    }
)
