-- Mapping helper
local mapper = function(mode, key, result, desc)
	vim.keymap.set(mode, key, result, { noremap = true, silent = true, desc = desc })
end

-- Change Buffers
-- mapper("n", "<Tab>", ":bnext<CR>")
-- mapper("n", "<S-Tab>", ":bprevious<Return>")

-- Split window
mapper("n", "ss", ":split<Return>", "Horizontal Split")
mapper("n", "sv", ":vsplit<Return>", "Vertical Split")

-- Select All
mapper("n", "<C-a>", "gg<S-v>G", "Select All")

-- Terminal
mapper("t", "<Esc>", "<C-\\><C-n>", "Exit Terminal Mode")

-- Move
mapper("x", "K", ":move '<-2<CR>gv-gv", "Move Selection Up")
mapper("x", "J", ":move '>+1<CR>gv-gv", "Move Selection Down")
mapper("i", "<C-BS>", "<Esc>caw", "Delete Word Backward")

-- Clear highlights
mapper("n", "<F9>", ":noh<CR>", "Clear Search Highlights")

-- Diagnostics, session and files
mapper("n", "<leader>cd", function()
	vim.diagnostic.open_float()
end, "Line Diagnostics")
mapper("n", "<leader>qq", "<cmd>qa!<CR>", "Quit")
mapper("n", "<leader>qs", "<cmd>close<CR>", "Close Window")
mapper("n", "<leader>wa", "<cmd>wa<CR>", "Save All Files")
mapper("n", "<leader>wq", "<cmd>wq!<CR>", "Save and Quit")
mapper("n", "<leader>ww", "<cmd>w<CR>", "Save File")

-- Compiler C++
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function(event)
		vim.keymap.set("n", "<F5>", ":w <bar> !g++ % <cr>", { buffer = event.buf, desc = "Compile C++ File" })
	end,
})
-- Compiler C
vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function(event)
		vim.keymap.set("n", "<F5>", ":w <bar> !gcc % <cr>", { buffer = event.buf, desc = "Compile C File" })
	end,
})
-- Compiler Python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function(event)
		vim.keymap.set("n", "<F5>", ":w <bar> !python % <cr>", { buffer = event.buf, desc = "Run Python File" })
	end,
})
