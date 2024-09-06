local o = vim.o
o.termguicolors = true
vim.loader.enable()

if vim.g.vscode then
	require("core.settings")
	require("core.keymaps")
else
	vim.g.mapleader = " "
	require("core")
	require("lsp")
	require("plugins_settings")

	local cmd = vim.cmd
	o.background = "dark"

	-- Themes and configs
	 vim.g.neosolarized_italic = 1
	cmd("colorscheme catppuccin-mocha")
end

-- Mapping helper
-- local mapper = function(mode, key, result)
--   vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
-- end
