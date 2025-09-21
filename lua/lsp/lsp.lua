local nvim_lsp = require("lspconfig")

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
	-- "ts_ls", -- replace for https://github.com/pmizio/typescript-tools.nvim
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
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
	})
	if lsp == "tailwindcss" then
		nvim_lsp[lsp].setup({
			root_dir = util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "package.json", ".git"),
		})
	end
	if lsp == "eslint" then
		nvim_lsp[lsp].setup({
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

vim.o.updatetime = 250
-- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
-- vim.diagnostic.config({
-- 	float = { border = "rounded" },
-- 	virtual_text = true,
-- 	signs = true,
-- 	update_in_insert = false,
-- })
