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
			"<leader>k",
			"<cmd>Lspsaga hover_doc<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Documentation on hover (lspsaga)",
		},
		{
			"<leader>cd",
			"<cmd>Lspsaga show_line_diagnostics<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Diagnostics: Show line's (lspsaga)",
		},
		{
			"<leader>db",
			"<Cmd>Lspsaga show_buf_diagnostics<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Diagnostics: Show buffer's (lspsaga)",
		},
		{
			"<leader>fs",
			"<Cmd>Lspsaga finder<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Find references (lspsaga)",
		},
		{
			"<leader>gp",
			"<Cmd>Lspsaga peek_definition<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Peek definition (lspsaga)",
		},
		{
			"<leader>gt",
			"<cmd>Lspsaga peek_type_definition<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Peek type definition (lspsaga)",
		},
		{
			"<leader>rn",
			"<cmd>Lspsaga rename<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Rename (lspsaga)",
		},
		{
			"<leader>o",
			"<cmd>Lspsaga outline<CR>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Show file outline (lspsaga) - 'e' to jump, 'o' to toggle",
		},
		{
			"<leader>ca",
			"<cmd>Lspsaga code_action<CR>",
			mode = { "n", "v" },
			desc = "Show code action (lspsaga)",
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
})

--- In lsp attach function
local keymap = vim.keymap.set

keymap("n", "<C-j>", "<cmd>Lspsaga term_toggle<cr>", { silent = true })
