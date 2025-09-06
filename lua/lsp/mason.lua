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

-- codelldb
-- rust-analyzer
-- prettierd
-- css-lsp
-- diagnostic-languageserver
-- emmet-ls
-- eslint-lsp
-- html-lsp
-- prettier
-- rustywind
-- stylua
-- tailwindcss-language-server

require("mason-nvim-dap").setup()
