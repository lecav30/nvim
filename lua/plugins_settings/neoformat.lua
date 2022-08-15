-- Reference:
-- https://jdhao.github.io/2020/04/19/nvim_cpp_and_c_completion/
-- custom setting for clangformat
vim.g.neoformat_enabled_cpp = clangformat
vim.g.neoformat_enabled_c = clangformat
vim.g.neoformat_cpp_clangformat = {
    exe = "clang-format",
    args = {'--style="{BasedOnStyle: Google, IndentWidth: 4}"'}
}

vim.g.neoformat_enabled_lua = luafmt

local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

mapper("n", "<Leader>fn", ":Neoformat<CR>")
