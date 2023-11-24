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
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"lua",
		"json",
		"markdown",
		"markdown_inline",
		"astro",
		-- "vue",
		-- "latex",
		-- "fish",
		-- "cpp",
		-- "python",
		-- "java",
		-- "php",
		-- "kotlin",
		-- "dart",
		-- "help",
	},
})
