local o = vim.o
local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local cmd = vim.cmd

local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = ""
}

for option, value in pairs(powershell_options) do
    vim.opt[option] = value
end

-- Enable syntax highlighting and filetype plugins
cmd("syntax enable")
cmd("filetype plugin on")

opt.colorcolumn = "90"

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
o.mouse = "a"
o.nrformats = ""
o.path = ".,,"
o.showmode = false
o.showtabline = 1
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.swapfile = true
o.updatetime = 2000
o.clipboard = "unnamedplus"
o.showmatch = true
o.ruler = true
o.showcmd = true
o.encoding = "utf-8"

-- Window options
o.foldmethod = "manual" -- indentation folds
o.relativenumber = true
o.number = true
o.signcolumn = "yes" -- make sure this is on for gitsigns.nvim, otherwise the signcolumn changes size constantly
o.wrap = true -- text autofit in a line

-- Set completeopt to have a better completion experience
o.completeopt = "menuone,noselect"

