vim.g.copilot_filetypes = { xml = false, markdown = false }

vim.cmd([[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]])

vim.cmd([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])
