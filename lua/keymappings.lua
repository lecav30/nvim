vim.g.mapleader = " "

-- Mapping helper
local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

-- Save and Close
mapper("n", "<Leader>ww", ":w<CR>")
mapper("n", "<Leader>wa", ":wa<CR>")
mapper("n", "<Leader>wq", ":wqa<CR>")
mapper("n", "<Leader>qq", ":qa!<CR>")

-- Change Tabs
mapper("n", "<Tab>", ":tabnext<Return>")
mapper("n", "<S-Tab>", ":tabprev<Return>")
-- Change Buffers
mapper("n", "<C-n>", ":bnext<CR>")
mapper("n", "<C-p>", ":bprevious<Return>")

-- Delete buffers
mapper("n", "<Leader>bd", ":bdelete<CR>")

-- Select All
mapper("n", "<C-a>", "gg<S-v>G")

-- Terminal
mapper("t", "<Esc>", "<C-\\><C-n>")

-- Move
mapper("x", "K", ":move '<-2<CR>gv-gv")
mapper("x", "J", ":move '>+1<CR>gv-gv")

-- Compiler C++
-- vim.api.nvim_command("autocmd filetype cpp nnoremap <f5> :w <bar> !g++ % -o %:r <cr> :terminal %:r<cr>")
vim.api.nvim_command("autocmd filetype cpp nnoremap <f5> :w <bar> !g++ % <cr>")
