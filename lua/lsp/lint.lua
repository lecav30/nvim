require("lint").linters_by_ft = {
	html = { "eslint" },
	css = { "stylelint" },
	javascript = { "eslint" },
	typescript = { "eslint" },
	json = { "eslint" },
	yaml = { "yamllint" },
	markdown = { "markdownlint" },
	lua = { "luacheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
