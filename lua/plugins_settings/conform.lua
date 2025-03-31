require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier", "prettierd", stop_after_first = true },
  },
})
