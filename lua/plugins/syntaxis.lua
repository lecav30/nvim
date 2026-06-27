return {
	---------------------------------------------------------------------------------
	------------------------------------- Format ------------------------------------
	---------------------------------------------------------------------------------
	{
		"stevearc/conform.nvim",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })
				end,
				desc = "Format Code",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	}, -- Format
	---------------------------------------------------------------------------------
	--------------------------------- Indent, color ---------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-mini/mini.indentscope",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	}, -- Indentation guides
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plugins_settings.treesitter")
		end,
		opts_extend = { "ensure_installed" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			{
				"windwp/nvim-ts-autotag",
				opts = {},
			}, -- Rename
			"nvim-treesitter/nvim-treesitter-textobjects",
		}, -- Comments for tsx and jsx
	}, -- Treesitter (Highlighting)
	---------------------------------------------------------------------------------
	------------------------------------- HTML --------------------------------------
	---------------------------------------------------------------------------------
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	}, -- Colorizer
}
