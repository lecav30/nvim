require("mason").setup(
    {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
        PATH = "prepend"
    }
)

require("mason-lspconfig").setup(
    {
        ensure_installed = {"sumneko_lua", "cssls", "html", "tsserver", "tailwindcss", "clangd", "pyright"}
    }
)

local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- local bufopts = {noremap = true, silent = true, buffer = bufnr}

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set(
    --     "n",
    --     "<space>wl",
    --     function()
    --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --     end,
    --     bufopts
    -- )
    -- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {"tsserver", "clangd", "pyright", "html", "cssls", "sumneko_lua", "tailwindcss"}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

nvim_lsp.angularls.setup {
    filetypes = {"typescript", "html", "typescriptreact", "typescript.tsx"},
    cmd = {"ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", ""},
    root_dir = function(fname)
        return vim.loop.cwd()
    end,
    autostart = false
}

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
