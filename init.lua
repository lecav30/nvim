local o = vim.o
o.termguicolors = true
vim.loader.enable()

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

	local cmd = vim.cmd
	o.background = "dark"

	-- Themes and configs
	--  vim.g.neosolarized_italic = 1
  -- cmd("colorscheme nord")
end

-- Mapping helper
-- local mapper = function(mode, key, result)
--   vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
-- end
