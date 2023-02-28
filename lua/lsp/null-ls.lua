local null_ls = require("null-ls")

null_ls.setup({
    debug = false,
    sources = {
        null_ls.builtins.formatting.prettier.with({
          extra_args = {'--single-quote', '--tab-width', '4', '--trailing-comma', 'all'},
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" }
        }),
        null_ls.builtins.formatting.clang_format.with({
            extra_args = {
                "--style",
                "{BasedOnStyle: Google, IndentWidth: 4, BreakBeforeBinaryOperators: NonAssignment, AllowShortFunctionsOnASingleLine: None}",
            },
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.code_actions.gitsigns,
    },
    diagnostics_format = '[#{c}] #{m} (#{s})',
})

-- null_ls.builtins.completion.,
-- null_ls.builtins.diagnostics.,
vim.cmd('map <Leader>lf :lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>')
