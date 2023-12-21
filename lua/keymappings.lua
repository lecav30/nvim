-- Mapping helper
local mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

-- Save and Close
mapper("n", "<Leader>ww", ":w<CR>")
mapper("n", "<Leader>wa", ":wa<CR>")
mapper("n", "<Leader>wq", ":wq!<CR>")
mapper("n", "<Leader>qq", ":q!<CR>")
mapper("n", "<Leader>qa", ":qa!<CR>")

-- Change Buffers
mapper("n", "<Tab>", ":bnext<CR>")
mapper("n", "<S-Tab>", ":bprevious<Return>")

-- Delete buffers
mapper("n", "<Leader>bd", ":bdelete<CR>")

-- Select All
mapper("n", "<C-a>", "gg<S-v>G")

-- Terminal
mapper("t", "<Esc>", "<C-\\><C-n>")

-- Move
mapper("x", "K", ":move '<-2<CR>gv-gv")
mapper("x", "J", ":move '>+1<CR>gv-gv")
mapper("i", "<C-BS>", "<Esc>caw")

-- Clear highlights
mapper("n", "<F9>", ":noh<CR>")

-- Compiler C++
vim.api.nvim_command("autocmd filetype cpp nnoremap <f5> :w <bar> !g++ % <cr>")
-- Compiler C
vim.api.nvim_command("autocmd filetype c nnoremap <f5> :w <bar> !gcc % <cr>")
-- Compiler Python
vim.api.nvim_command("autocmd filetype python nnoremap <f5> :w <bar> !python % <cr>")
