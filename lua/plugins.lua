--Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Better time loading lua modules
  use 'lewis6991/impatient.nvim'

  -- THEMES
  -- Monokai theme
  use 'tanvirtin/monokai.nvim'

  -- Rose-Pine theme
  use({
      'rose-pine/neovim',
      as = 'rose-pine',
   })

  -- Nord-vim theme
  use 'arcticicestudio/nord-vim'

  -- Indentation guides to all lines
  use "lukas-reineke/indent-blankline.nvim"

  -- Autopairs 
  use 'windwp/nvim-autopairs'

  -- Treesitter - Highlight and indent
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  -- Icons for nerd fonts
  use 'kyazdani42/nvim-web-devicons'

  -- File explorer
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Tree file explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      -- config = function() require'nvim-tree'.setup {} end
  }

  -- Completion engine plugin 
  use 'neovim/nvim-lspconfig'

  -- CMP - Completation engine plugin 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- LuaSnip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- Icons for lsp
  use 'onsails/lspkind.nvim'
  -- Light bulb
  use 'kosayoda/nvim-lightbulb'

  -- Start screen 
  use {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.opts)
      end
  }

  -- Tab and Buffer tabline
  use {
      'kdheepak/tabline.nvim',
      config = function()
        vim.cmd[[
          set guioptions-=e " Use showtabline in gui vim
          set sessionoptions+=tabpages,globals " store tabpages and globals in session
        ]]
      end,
      requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
    }

  -- Lualine, best statusline in lua
  use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Better comments for neovim 
  use "terrortylor/nvim-comment"

  -- Close tag HTML
  use 'alvan/vim-closetag'

 -- Rename tag HTML
   use 'AndrewRadev/tagalong.vim'

end)
