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

require("mason-lspconfig").setup({
	ensure_installed = {
		"cssls",
		"html",
		"emmet_ls",
		"tsserver",
		"tailwindcss",
		"pyright",
		"clangd",
		"volar",
		"angularls",
		"intelephense",
		"diagnosticls",
		-- formatters
		-- "black",
		-- "isort",
		-- "prettier",
	},
})

local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
	-- Mappings.
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
	"cssls",
	"html",
	"emmet_ls",
	"tsserver",
	"eslint",
	"tailwindcss",
	"pyright",
	"volar",
	"angularls",
	"intelephense",
	"diagnosticls",
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	if lsp == "html" then
		nvim_lsp[lsp].setup({
			filetypes = {
				"html",
				"htmldjango",
			},
		})
	end
	if lsp == "emmet_ls" then
		nvim_lsp[lsp].setup({
			filetypes = {
				"html",
				"htmldjango",
				"typescriptreact",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				"less",
				"eruby",
			},
		})
	end
	if lsp == "intelephense" then
		nvim_lsp[lsp].setup({
			root_dir = function()
				return vim.loop.cwd()
			end,
		})
	end
end

capabilities.offsetEncoding = { "utf-16" }

nvim_lsp.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.o.updatetime = 250
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
