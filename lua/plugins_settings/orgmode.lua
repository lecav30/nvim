vim.opt.shellslash = true

local Menu = require("org-modern.menu")
require("orgmode").setup({
	mappings = {
		org = {
			org_toggle_checkbox = "<leader>x",
		},
	},
	org_agenda_files = "~/org/**/*",
	org_default_notes_file = "~/org/refile.org",
	org_todo_keywords = {
		"TODO(t)", -- pending task
		"IN-PROGRESS(i)", -- working on it
		"WAITING(w)", -- blocked or waiting for something
		"|", -- separator
		"DONE(d)", -- completed task
		"CANCELLED(c)", -- cancelled or abandoned task
	},
	org_todo_keyword_faces = {
		TODO = ":foreground red :weight bold",
		INPROGRESS = ":foreground orange :weight bold",
		WAITING = ":foreground yellow :slant italic",
		DONE = ":foreground green :weight bold",
		CANCELLED = ":foreground gray :slant italic",
	},
	-- Plugin Agenda
	ui = {
		menu = {
			handler = function(data)
				Menu:new():open(data)
			end,
		},
	},
})

-- Plugins
require("org-bullets").setup()
