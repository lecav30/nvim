local wk = require("which-key")

wk.register({
	["<leader>"] = {
		b = {
			name = "+buffer",
			l = { "<cmd>Telescope buffers<cr>", "Buffers" },
			d = { "<cmd>bdelete<cr>", "Delete Buffer" },
			s = { "<cmd>split<cr>", "Split Buffer" },
			v = { "<cmd>vsplit<cr>", "VSplit Buffer" },
		},
		c = {
			name = "+code",
			a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
			d = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Code Diagnostics" },
			f = { "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<cr>", "Format Code" },
			l = { "Comment Line" },
			b = { "Comment Block" },
		},
    db = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "Diagnostics" },
		e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		o = { "<cmd>Lspsaga outline<cr>", "Outline" },
		f = {
			name = "+find",
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
			s = { "<cmd>Lspsaga finder<cr>", "Fin uses" },
			w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Fuzzy" },
			o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		},
		g = {
			name = "+git & lsp",
			b = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
			c = { "<cmd>Telescope git_commits<cr>", "Git Commits" },
			s = { "<cmd>Telescope git_status<cr>", "Git Status" },
			D = { "Go to Declaration" },
			d = { "Go to Definition" },
			i = { "Go to Implementation" },
			I = { "<cmd>Gitignore<cr>" },
		},
		k = { "<cmd>Lspsaga hover_doc<cr>", "Hover Doc" },
		q = {
			name = "+quit",
			q = { "Quit current file" },
			a = { "Quit all" },
		},
		rn = { "<cmd>Lspsaga rename<cr>", "Rename" },
		w = {
			name = "+save",
			w = { "Save file" },
			a = { "Save all files" },
			q = { "Save all files and quit" },
		},
		v = {
			name = "+vimtex",
			v = { "<cmd>VimtexView<cr>", "View" },
			e = { "<cmd>VimtexErrors<cr>", "Errors" },
			c = { "<cmd>VimtexCompile<cr>", "Compile" },
			s = { "<cmd>VimtexStatus<cr>", "Status" },
			t = { "<cmd>VimtexStop<cr>", "Stop" },
		},
	},
})
