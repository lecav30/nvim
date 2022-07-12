require 'nvim-treesitter.install'.compilers = { "clang" }

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "cpp",
    "python",
    "html",
    "css",
    "javascript",
    "lua",
    "json",
    "markdown"
  }
}

