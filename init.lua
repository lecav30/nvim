if vim.g.vscode then
	require("keymappings")
	require("settings")
else
	vim.g.mapleader = " "
	require("plugins")
	require("plugins_settings")
	require("lsp")
	require("keymappings")
	require("settings")

	local o = vim.o
	local cmd = vim.cmd

	o.termguicolors = true
	-- o.background = "dark"
	o.background = "light"

	-- Themes and configs
	-- cmd("colorscheme moonfly")
  -- cmd("colorscheme nord")
  -- cmd("colorscheme tender")
  -- cmd("colorscheme catppuccin-mocha")
  -- cmd("colorscheme sonokai")
  -- cmd("colorscheme gruvbox-baby")
  cmd("colorscheme solarized")
end

-- Mapping helper
-- local mapper = function(mode, key, result)
--   vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
-- end
