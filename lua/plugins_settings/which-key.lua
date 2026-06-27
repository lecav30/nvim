local wk = require("which-key")

wk.setup({
	win = { border = "single", col = 0.5 },
	preset = "modern",
})

wk.add({
	{ "<leader>b", group = "Buffer" },
	{ "<leader>c", group = "Code" },
	{ "<leader>d", group = "Harpoon" },
	{ "<leader>f", group = "Find" },
	{ "<leader>g", group = "Git & LSP" },
	{ "<leader>q", group = "Quit" },
	{ "<leader>w", group = "Save" },
	{ "<leader>x", group = "Trouble" },
})
