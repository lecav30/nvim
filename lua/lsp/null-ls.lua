local null_ls = require("null-ls")

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.prettier.with({
			extra_args = { "--single-quote", "--tab-width", "4", "--trailing-comma", "all" },
			filetypes = {
				"javascript",
				"typescript",
			},
		}), -- JavaScript, TypeScript
		null_ls.builtins.formatting.prettier.with({
			extra_args = { "--tab-width", "2" },
			filetypes = {
				"typescriptreact",
				"javascriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
			},
		}), -- Vue, CSS, HTML, JSON, YAML, Markdown
		null_ls.builtins.formatting.clang_format.with({
			extra_args = {
				"--style",
				"{BasedOnStyle: Google, IndentWidth: 4, BreakBeforeBinaryOperators: NonAssignment, AllowShortFunctionsOnASingleLine: None}",
			},
		}), -- C/C++
		null_ls.builtins.formatting.latexindent, -- LaTeX
		null_ls.builtins.formatting.isort, -- Python
		null_ls.builtins.formatting.autopep8, -- Python
		null_ls.builtins.formatting.stylua, -- Lua
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.eslint, -- JavaScript, TypeScript
		null_ls.builtins.diagnostics.pylint, -- Python
	},
	diagnostics_format = "[#{c}] #{m} (#{s})",
})

-- null_ls.builtins.completion.,
-- null_ls.builtins.diagnostics.,
