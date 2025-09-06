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
		"tsx",
		"lua",
		"json",
		"markdown",
		"markdown_inline",
		"latex",
		-- "rust"
		-- "toml"
		-- "fish",
		-- "astro",
		-- "vue",
		-- "php",
		-- "kotlin",
		-- "dart",
		-- "help",
	},
})
