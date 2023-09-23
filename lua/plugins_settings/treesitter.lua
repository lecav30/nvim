require("nvim-treesitter.install").compilers = { "clang" }

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	},
	auto_install = true,
	sync_install = false,
	ensure_installed = {
		"cpp",
		"python",
		"java",
		"html",
		"css",
		"javascript",
		"typescript",
		"vue",
		"tsx",
		"lua",
		"json",
		"markdown",
		"latex",
		"fish",
		"astro",
		-- "php",
		-- "kotlin",
		-- "dart",
		-- "help",
	},
})
