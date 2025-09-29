local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = {
	"html",
	"cssls",
	"emmet_ls",
	"tailwindcss",
	"diagnosticls",
	"eslint",
	"lua_ls",
	"rust_analyzer",
	-- "ts_ls", -- replaced for https://github.com/pmizio/typescript-tools.nvim
	-- "biome",
	-- "astro",
	-- "volar",
	-- "angularls",
	-- "pyright",
	-- "python-lsp-server",
	-- "pylint",
}

local util = require("lspconfig.util")

for _, lsp in ipairs(servers) do
	vim.lsp.config(lsp, {
		capabilities = capabilities,
	})
	-- if lsp == "tailwindcss" then
	-- 	vim.lsp.config(lsp, {
	-- 		root_dir = util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "package.json", ".git"),
	-- 	})
	-- end
	if lsp == "eslint" then
		vim.lsp.config(lsp, {
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
		})
	end
	if lsp == "html" then
		vim.lsp.config(lsp, {
			filetypes = {
				"html",
				"htmldjango",
			},
		})
	end
	if lsp == "emmet_ls" then
		vim.lsp.config(lsp, {
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
		vim.lsp.config(lsp, {
			root_dir = function()
				return vim.loop.cwd()
			end,
		})
	end

	vim.lsp.enable(lsp)
end

capabilities.offsetEncoding = { "utf-16" }

vim.o.updatetime = 250
-- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
-- vim.diagnostic.config({
-- 	float = { border = "rounded" },
-- 	virtual_text = true,
-- 	signs = true,
-- 	update_in_insert = false,
-- })
