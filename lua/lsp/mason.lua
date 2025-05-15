require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	PATH = "prepend",
})

require("mason-nvim-dap").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"cssls",
		"emmet_ls",
		"ts_ls",
    -- "eslint",
    "biome",
		"tailwindcss",
		"diagnosticls",
		-- "astro",
		-- "clangd",
		-- "angularls",
		-- "volar",
	},
})
