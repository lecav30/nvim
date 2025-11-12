local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = {
	"html",
	"cssls",
	"emmet_ls",
	"tailwindcss",
	"diagnosticls",
	"lua_ls",
	-- "rust_analyzer",
	"ts_ls",
}

for _, lsp in ipairs(servers) do
	vim.lsp.config(lsp, {
		capabilities = capabilities,
	})

	vim.lsp.enable(lsp)
end

vim.o.updatetime = 250
