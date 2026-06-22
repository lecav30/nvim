vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open All Folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close All Folds" })

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})
