require("lint").linters_by_ft = {
	html = { "eslint_d" },
	css = { "stylelint" },
	javascript = { "biomejs" },
	typescript = { "biomejs" },
	json = { "biomejs" },
	yaml = { "yamllint" },
	markdown = { "markdownlint" },
	lua = { "luacheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
