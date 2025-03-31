local o = vim.o
o.termguicolors = true
vim.loader.enable()

if vim.g.vscode then
	require("core")
else
	vim.g.mapleader = " "
	require("core")
	require("config.lazy")
	require("lsp")
	require("plugins_settings")

	local cmd = vim.cmd
	-- o.background = "dark"

	-- Themes and configs
	vim.g.neosolarized_italic = 1
	cmd("colorscheme catppuccin")
end
