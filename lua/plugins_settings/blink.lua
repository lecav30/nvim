local blink = require("blink.cmp")

blink.setup({
	keymap = {
		preset = "default",
		["<C-k>"] = { "select_next", "snippet_forward", "fallback" },
		["<C-j>"] = { "select_prev", "snippet_backward", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<C-e>"] = { "hide" },
		["<C-space>"] = { "show" },
	},
	sources = {
		default = { "lsp", "snippets", "buffer", "path" },
		-- Si tienes providers personalizados: providers = { ... }
	},
	snippets = {
		preset = "luasnip",
	},
	appearance = {
		kind_icons = {
			Supermaven = "",
			-- Puedes agregar otros icons si los necesitas
		},
	},
	cmdline = {
		enabled = true, -- asegúrate de habilitarlo si lo quieres
		sources = {
			["/"] = { "buffer" },
			[":"] = { "path", "cmdline" },
		},
	},
	fuzzy = {
		implementation = "lua", -- evita el warning
	},
})
