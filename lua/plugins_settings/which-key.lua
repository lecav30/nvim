local wk = require("which-key")

wk.setup({
	win = { border = "single", col = 0.5 },
	preset = "modern",
})

wk.add({
	-- Pickers
	{
		"<leader><leader>",
		"<cmd>Telescope builtin<CR>",
		desc = "Find Pickers",
	},

	-- Buffers
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
	{
		"<leader>bw",
		function()
			require("mini.bufremove").delete(0, false)
		end,
		desc = "Delete Buffer",
	},

	-- Code actions
	{ "<leader>c", group = "Code" },
	{
		"<leader>ca",
		function()
			vim.lsp.buf.code_action()
		end,
		desc = "Code Action",
	},
	{
		"<leader>cd",
		function()
			vim.diagnostic.open_float()
		end,
		desc = "Line Diagnostics",
	},
	{ "<leader>ce", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
	{
		"<leader>cf",
		function()
			require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })
		end,
		desc = "Format Code",
	},

	-- Harpoon mappings live in plugins_settings.harpoon
	{ "<leader>d", group = "Harpoon" },

	-- Files and search
	{ "<leader>e", "<cmd>Oil<cr>", desc = "Oil Explorer" },
	{ "<leader>f", group = "Find" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fh", desc = "Find Harpoon Files" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
	{ "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current Buffer Fuzzy" },
	{
		"<leader>s",
		"<cmd>lua require'spectre'.toggle()<cr>",
		desc = "Toggle Spectre",
	},

	-- Git and direct LSP jumps
	{ "<leader>g", group = "Git & LSP" },
	{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
	{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
	{
		"<leader>gd",
		function()
			vim.lsp.buf.declaration()
		end,
		desc = "Go to Declaration",
	},
	{
		"<leader>gD",
		function()
			vim.lsp.buf.definition()
		end,
		desc = "Go to Definition",
	},
	{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },

	-- LSP actions that Trouble does not replace
	{
		"<leader>k",
		function()
			vim.lsp.buf.hover()
		end,
		desc = "Hover Documentation",
	},
	{
		"<leader>rn",
		function()
			vim.lsp.buf.rename()
		end,
		desc = "Rename",
	},

	-- Session and windows
	{ "<leader>q", group = "Quit" },
	{ "<leader>qq", ":qa!<CR>", desc = "Quit" },
	{ "<leader>qs", ":close<CR>", desc = "Close Window" },
	{ "<leader>w", group = "Save" },
	{ "<leader>wa", ":wa<CR>", desc = "Save All Files" },
	{ "<leader>wq", ":wq!<CR>", desc = "Save and Quit" },
	{ "<leader>ww", ":w<CR>", desc = "Save File" },

	-- Trouble
	{ "<leader>x", group = "Trouble" },
	{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostics" },
	{ "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
	{ "<leader>xd", "<cmd>Trouble lsp_definitions toggle<cr>", desc = "Definitions" },
	{ "<leader>xD", "<cmd>Trouble lsp_declarations toggle<cr>", desc = "Declarations" },
	{ "<leader>xi", "<cmd>Trouble lsp_incoming_calls toggle<cr>", desc = "Incoming Calls" },
	{
		"<leader>xl",
		"<cmd>Trouble lsp toggle<cr>",
		desc = "LSP Definitions / References",
	},
	{ "<leader>xm", "<cmd>Trouble lsp_implementations toggle<cr>", desc = "Implementations" },
	{ "<leader>xo", "<cmd>Trouble lsp_outgoing_calls toggle<cr>", desc = "Outgoing Calls" },
	{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
	{ "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", desc = "References" },
	{ "<leader>xs", "<cmd>Trouble symbols toggle focus=true<cr>", desc = "Document Symbols" },
	{ "<leader>xt", "<cmd>Trouble lsp_type_definitions toggle<cr>", desc = "Type Definitions" },
	{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },

	-- VimTeX
	{ "<leader>v", group = "VimTeX" },
	{ "<leader>vc", "<cmd>VimtexCompile<cr>", desc = "Compile" },
	{ "<leader>ve", "<cmd>VimtexErrors<cr>", desc = "Errors" },
	{ "<leader>vs", "<cmd>VimtexStatus<cr>", desc = "Status" },
	{ "<leader>vt", "<cmd>VimtexStop<cr>", desc = "Stop" },
	{ "<leader>vv", "<cmd>VimtexView<cr>", desc = "View" },

	-- Focus mode
	{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
})
