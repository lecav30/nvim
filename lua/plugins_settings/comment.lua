require("Comment").setup({
	toggler = {
		line = "<leader>cl",
		block = "<leader>cb",
	},
	opleader = {
		line = "<leader>cl",
		block = "<leader>cb",
	},
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

-- local ft = require("Comment.ft")
-- ft.set("javascriptreact", { "{/*%s*/}", "{/*%s*/}" }).set("typescriptreact", { "{/*%s*/}", "{/*%s*/}" })
