local o = vim.o
o.termguicolors = true
vim.loader.enable()

-- Detect OS
local sysname = vim.loop.os_uname().sysname

if sysname == "Windows_NT" then
	vim.g.vimtex_view_method = "general"
	vim.g.vimtex_view_general_viewer = "SumatraPDF"
	vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
-- use sumatrapdf on windows by default
elseif sysname == "Darwin" then
	vim.g.vimtex_view_method = "skim"
else -- Assume Linux
	vim.g.vimtex_view_method = "zathura"
end

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
	cmd("colorscheme gruvbox")
	-- cmd("colorscheme monet")
end
