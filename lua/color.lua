local o = vim.o
local cmd = vim.cmd

-- colorscheme global defaults
o.termguicolors = true
-- o.winblend = 0

-- Themes and configs
-- cmd("colorscheme material")
-- cmd("colorscheme moonfly")
-- cmd("colorscheme catppuccin-mocha")
o.background = "dark"
cmd("colorscheme NeoSolarized")
