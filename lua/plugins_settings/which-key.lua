local wk = require("which-key")

wk.setup({
	win = { border = "single", col = 0.5 },
	preset = "modern",
})

wk.add({
	{
		"<leader><leader>",
		"<CMD>lua require 'telescope'.extensions.find_pickers.find_pickers()<CR>",
		desc = "Find Pickers",
	},
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
	-- { "<leader>bw", "<cmd>bdelete<cr>", desc = "Delete Buffer" },
	{
		"<leader>bw",
		function()
			require("mini.bufremove").delete(0, false)
		end,
		desc = "Delete Buffer",
	},
	{
		"<leader>bd",
		function()
			vim.diagnostic.setloclist()
		end,
		desc = "Buffer Diagnostics",
	},
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
	{ "<leader>d", group = "Debug" },
	{ "<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run to Cursor" },
	{ "<leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", desc = "Evaluate Input" },
	{
		"<leader>dC",
		"<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
		desc = "Conditional Breakpoint",
	},
	{ "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
	{ "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
	{ "<leader>db", "<cmd>lua require'dapui'.step_back()<cr>", desc = "Step Back" },
	{ "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
	{ "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate" },
	{ "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
	{ "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", desc = "Hover Variables" },
	{ "<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", desc = "Scopes" },
	{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
	{ "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
	{ "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", desc = "Pause" },
	{ "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
	{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
	{ "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
	{ "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
	{ "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate" },
	{ "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
	{ "<leader>e", "<cmd>Oil<cr>", desc = "Buffer File Explorer" },
	{ "<leader>f", group = "Find" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
	{ "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current Buffer Fuzzy" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
	{ "<leader>g", group = "Git & LSP" },
	{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
	{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
	{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
	{
		"<leader>gD",
		function()
			vim.lsp.buf.declaration()
		end,
		desc = "Go to Declaration",
	},
	{
		"<leader>gi",
		function()
			local method = "textDocument/prepareCallHierarchy"
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			local params, client

			-- buscar cliente válido
			for _, c in ipairs(clients) do
				if c.supports_method and c:supports_method(method) then
					client = c
					params = vim.lsp.util.make_position_params(0, c.offset_encoding)
					break
				end
			end

			if not client then
				vim.notify("No LSP client supports call hierarchy", vim.log.levels.WARN)
				return
			end

			-- preparar jerarquía
			client.request(method, params, function(err, result)
				if err or not result or vim.tbl_isempty(result) then
					vim.notify("No incoming calls available", vim.log.levels.INFO)
					return
				end

				-- ahora pedimos incoming calls solo a este cliente
				client.request("callHierarchy/incomingCalls", { item = result[1] }, function(call_err, calls)
					if call_err or not calls or vim.tbl_isempty(calls) then
						vim.notify("No incoming calls found", vim.log.levels.INFO)
						return
					end

					local pickers = require("telescope.pickers")
					local finders = require("telescope.finders")
					local conf = require("telescope.config").values
					local actions = require("telescope.actions")
					local action_state = require("telescope.actions.state")

					local entries = {}
					for _, call in ipairs(calls) do
						local from = call.from
						local loc = from.selectionRange.start
						table.insert(entries, {
							filename = vim.uri_to_fname(from.uri),
							lnum = loc.line + 1,
							col = loc.character + 1,
							text = from.name,
						})
					end

					pickers
						.new({}, {
							prompt_title = "Incoming Calls",
							finder = finders.new_table({
								results = entries,
								entry_maker = function(e)
									return {
										value = e,
										display = e.text .. " -> " .. e.filename,
										ordinal = e.text .. " " .. e.filename,
										filename = e.filename,
										lnum = e.lnum,
										col = e.col,
									}
								end,
							}),
							sorter = conf.generic_sorter({}),
							previewer = conf.qflist_previewer({}),
							attach_mappings = function(prompt_bufnr, _)
								actions.select_default:replace(function()
									local selection = action_state.get_selected_entry()
									actions.close(prompt_bufnr)
									vim.cmd("edit " .. selection.filename)
									vim.api.nvim_win_set_cursor(0, { selection.lnum, selection.col - 1 })
								end)
								return true
							end,
						})
						:find()
				end)
			end, 0)
		end,
		desc = "Incoming calls (Telescope)",
	},
	{
		"<leader>gf",
		function()
			require("telescope.builtin").lsp_references()
		end,
		desc = "Find References",
	},
	{
		"<leader>go",
		function()
			require("telescope.builtin").lsp_document_symbols()
		end,
		desc = "Outline",
	},
	{
		"<leader>k",
		function()
			vim.lsp.buf.hover()
		end,
		desc = "Hover Documentation",
	},
	{ "<leader>q", group = "quit" },
	{ "<leader>qs", ":close<CR>", desc = "Close current sliding window" },
	-- { "<leader>qq", ":q!<CR>", desc = "Quit current file" },
	{ "<leader>qq", ":qa!<CR>", desc = "Quit" },
	{
		"<leader>rn",
		function()
			vim.lsp.buf.rename()
		end,
		desc = "Rename",
	},
	{
		"<leader>s",
		"<cmd>lua require'spectre'.toggle()<cr>",
		desc = "Toggle Spectre",
	},
	{ "<leader>w", group = "Save" },
	{ "<leader>ww", ":w<CR>", desc = "Save file" },
	{ "<leader>wa", ":wa<CR>", desc = "Save all files" },
	{ "<leader>wq", ":wq!<CR>", desc = "Save all files and quit" },
	{ "<leader>v", group = "Vimtex" },
	{ "<leader>vc", "<cmd>VimtexCompile<cr>", desc = "Compile" },
	{ "<leader>vv", "<cmd>VimtexView<cr>", desc = "View" },
	{ "<leader>ve", "<cmd>VimtexErrors<cr>", desc = "Errors" },
	{ "<leader>vs", "<cmd>VimtexStatus<cr>", desc = "Status" },
	{ "<leader>vt", "<cmd>VimtexStop<cr>", desc = "Stop" },
	{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
})
