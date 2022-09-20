-- Reference:
-- https://jdhao.github.io/2020/04/19/nvim_cpp_and_c_completion/
-- custom setting for clangformat
local g = vim.g

g.neoformat_enabled_cpp = { "clangformat" }
g.neoformat_cpp_clangformat = {
    exe = "clang-format",
    args = {'--style="{BasedOnStyle: Google, IndentWidth: 4}"'}
}
g.neoformat_enabled_c = { "clangformat" }
g.neoformat_enabled_lua = { "luafmt" }
g.neoformat_enabled_python = {"black", "isort"}
g.neoformat_enabled_yaml = {"prettier"}
g.neoformat_enabled_html = {"prettier"}
g.neoformat_enabled_css = {"prettier"}
g.neoformat_enabled_javascript = {"prettier"}
g.neoformat_enabled_typescript = {"prettier"}
g.neoformat_enabled_markdown = {"prettier"}

local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

mapper("n", "<Leader>fn", ":Neoformat<CR>")
