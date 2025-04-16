require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "biome", "prettier", "prettierd", stop_after_first = true },
		typescript = { "biome", "prettier", "prettierd", stop_after_first = true },
		javascriptreact = { "biome", "prettier", "prettierd", stop_after_first = true },
		typescriptreact = { "biome", "prettier", "prettierd", stop_after_first = true },
		markdown = { "prettier", "prettierd", stop_after_first = true },
		json = { "prettier", "prettierd", stop_after_first = true },
		html = { "prettier", "prettierd", stop_after_first = true },
		css = { "prettier", "prettierd", stop_after_first = true },
	},
	formatters = {
		biome = {
			command = "biome",
			args = {
				"format",
				"--stdin-file-path",
				"$FILENAME",
				"--indent-style",
				"space",
			},
			stdin = true,
		},
	},
})
