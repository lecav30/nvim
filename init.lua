local o = vim.o
o.termguicolors = true
vim.loader.enable()

-- Queue notifications that fire before noice is active (pre-VimEnter)
-- so they don't trigger the "Press ENTER" hit-enter prompt.
local _notify_queue = {}
local _orig_notify = vim.api.nvim_notify
---@diagnostic disable-next-line: duplicate-set-field
vim.api.nvim_notify = function(msg, level, opts)
	if vim.v.vim_did_enter == 0 then
		table.insert(_notify_queue, { msg, level, opts })
		return
	end
	return _orig_notify(msg, level, opts)
end
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.api.nvim_notify = _orig_notify
		for _, n in ipairs(_notify_queue) do
			vim.schedule(function() _orig_notify(n[1], n[2], n[3]) end)
		end
	end,
})

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

	local cmd = vim.cmd
	-- o.background = "dark"

	-- Themes and configs
	cmd("colorscheme oxocarbon")
end
