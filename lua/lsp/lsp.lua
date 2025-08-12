local nvim_lsp = require("lspconfig")

-- local on_attach = function(client, bufnr)
-- Mappings.
-- local bufopts = { noremap = true, silent = true, buffer = bufnr }

-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
-- end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	"html",
	"cssls",
	"emmet_ls",
	"tailwindcss",
	"diagnosticls",
	"eslint",
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
		-- on_attach = on_attach,
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

-- Function to find the appropriate build directory
local function find_compile_commands_dir()
	local build_dir = "./build"
	local dirs = {}

	-- Get all subdirectories in the build directory
	for _, name in ipairs(vim.fn.readdir(build_dir)) do
		local path = build_dir .. "/" .. name
		if vim.fn.isdirectory(path) == 1 and vim.fn.filereadable(path .. "/compile_commands.json") == 1 then
			return path -- Return the directory containing compile_commands.json
		end
	end

	return build_dir -- Fallback to the default build directory if no subdirectories contain the file
end

nvim_lsp.clangd.setup({
	-- To recognize packages from vcpkg and cmake use the flag in cmake:
	-- -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
	cmd = {
		"clangd",
		"--compile-commands-dir=" .. find_compile_commands_dir(),
		"--background-index",
		"--clang-tidy",
		"--log=verbose",
	}, -- For cmake
	-- cmd = {
	-- 	"clangd",
	-- 	"--compile-commands-dir=" .. find_compile_commands_dir(),
	-- 	"--background-index",
	-- 	"--clang-tidy",
	-- 	"--log=verbose",
	-- }, -- For sub directories
	-- on_attach = on_attach,
	capabilities = capabilities,
})

vim.o.updatetime = 250
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
vim.diagnostic.config({
	float = { border = "rounded" },
	virtual_text = true,
	signs = true,
	update_in_insert = false,
})
