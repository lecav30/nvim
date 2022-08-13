-- Reference:
-- https://jdhao.github.io/2020/04/19/nvim_cpp_and_c_completion/
-- custom setting for clangformat
vim.g.neoformat_enabled_cpp = clangformat
vim.g.neoformat_enabled_c = clangformat
vim.g.neoformat_cpp_clangformat = {
  exe = "clang-format",
  args = {"--style=\"{BasedOnStyle: Google, IndentWidth: 4}\"",},
}
