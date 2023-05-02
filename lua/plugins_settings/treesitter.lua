require("nvim-treesitter.install").compilers = { "clang" }

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		custom_captures = {
			["foo.bar"] = "Identifier",
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	indent = {
		enable = false,
		disable = {},
	},
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
		"php",
		"fish",
		"lua",
		"json",
		"markdown",
		"help",
    "latex",
    "kotlin",
	},
})
