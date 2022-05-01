vim.g.mapleader = ' '

-- Mapping helper
local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

-- Save and Close
mapper("n", "<Leader>ww", ":w!<CR>")
mapper("n", "<Leader>wq", ":wq<CR>")
mapper("n", "<Leader>qq", ":q<CR>")

-- Change Buffer
mapper("n", "<C-M>", ":bnext<CR>")
mapper("n", "<C-N>", ":bprev<CR>")
mapper("n", "<TAB>", ":bnext<CR>")
mapper("n", "<S-TAB>", ":bprevious<CR>")
-- Delete buffers
mapper("n", "<C-B>", ":bdelete<CR>")

-- Treminal
mapper("t", "<Esc>", "<C-\\><C-n>")

