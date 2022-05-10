local o = vim.o
local opt = vim.opt
local cmd = vim.cmd

-- Enable syntax highlighting and filetype plugins
-- vim.cmd 'syntax enable'
-- vim.cmd 'filetype plugin on'
cmd('syntax enable')
cmd('filetype plugin on')

-- Buffer options
o.autoindent = true
o.expandtab = true
o.smartindent = true
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4

-- Global options
o.cursorline = true
o.exrc = true
o.hidden = true
o.ignorecase = true
o.laststatus = 2
o.mouse = 'a'
o.nrformats = ''
o.path = '.,,'
o.showmode = false
o.showtabline = 1
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.swapfile = true
o.updatetime = 2000
o.clipboard = 'unnamedplus'

-- Window options
o.foldmethod = 'manual' -- indentation folds
o.relativenumber = true
o.number = true
o.signcolumn = 'yes' -- make sure this is on for gitsigns.nvim, otherwise the signcolumn changes size constantly
o.wrap = false

-- colorscheme global defaults
o.background = 'dark'
o.termguicolors = true

-- Themes and configs
-- cmd('colorscheme rose-pine')
-- vim.g.rose_pine_variant = 'below'
cmd('colorscheme github_*')
-- cmd('colorscheme monokai_pro')

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'


