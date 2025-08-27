local lspsaga = require("lspsaga")

lspsaga.setup({
	lightbulb = {
		enable = false,
		sign = false,
	},
	outline = {
		layout = "float",
		max_height = 0.7,
		left_width = 0.4,
	},
	ui = { border = "rounded" },
	symbol_in_winbar = {
		enable = true,
		folder_level = 2,
	},
	diagnostic = {
		max_height = 0.8,
		keys = {
			quit = { "q", "<ESC>" },
		},
	},
	keys = {
		{
			"<leader>gj",
			"<cmd>Lspsaga diagnostic_jump_next<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Diagnostics: Jump next (lspsaga)",
		},
		{
			"<leader>gk",
			"<cmd>Lspsaga diagnostic_jump_prev<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Diagnostics: Jump next (lspsaga)",
		},
		{
			"<C-j>",
			"<cmd>Lspsaga term_toggle<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Toggle terminal (lspsaga)",
		},
	},
	finder_action_keys = {
		open = "o",
		vsplit = "<CR>",
		split = "s",
		tabe = "t",
		quit = { "q", "<ESC>" },
	},
})

--- In lsp attach function
local keymap = vim.keymap.set

keymap("n", "<C-j>", "<cmd>Lspsaga term_toggle<cr>", { silent = true })
