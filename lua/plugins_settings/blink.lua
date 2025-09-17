local blink = require("blink.cmp")

blink.setup({
	keymap = {
		preset = "default",
		-- Check : https://cmp.saghen.dev/configuration/keymap.html#default
	},
	sources = {
		default = { "lsp", "snippets", "buffer", "path" },
		providers = {
			supermaven = {
				name = "supermaven",
				module = "blink-cmp-supermaven",
				async = true,
			},
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
			selection = { preselect = true, auto_insert = true },
		},
		menu = {
			auto_show = true,
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", "kind" },
				},
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
		ghost_text = {
			enabled = false,
			show_with_menu = false,
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
