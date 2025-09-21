local blink = require("blink.cmp")

require("luasnip.loaders.from_vscode").lazy_load()

blink.setup({
	keymap = {
		preset = "default",
		-- Check : https://cmp.saghen.dev/configuration/keymap.html#default
	},
	sources = {
		default = { "lsp", "supermaven", "snippets", "buffer", "path" },
		providers = {
			lsp = { name = "[LSP]" },
			supermaven = {
				name = "[AI]",
				module = "blink-cmp-supermaven",
				async = true,
			},
			snippets = { name = "[Snip]" },
			buffer = { name = "[Buffer]" },
			path = { name = "[Path]" },
		},
	},
	signature = { enabled = true },
	snippets = {
		preset = "luasnip",
	},
	appearance = {
		kind_icons = {
			Supermaven = "",
		},
	},
	completion = {
		list = {
			selection = { preselect = false, auto_insert = false },
		},
		menu = {
			auto_show = true,
			draw = {
				columns = {
					{ "label", "label_description", gap = 2 },
					{ "kind_icon", gap = 2, "kind" },
					{ "source_name" },
				},
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
		ghost_text = {
			enabled = true,
			show_with_menu = true,
		},
	},
	cmdline = {
		keymap = { preset = "cmdline" },
		enabled = true,
		sources = {
			"buffer",
			"path",
			"cmdline",
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
