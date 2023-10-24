-- default components
local bufferlist = require("ide.components.bufferlist")
local explorer = require("ide.components.explorer")
local outline = require("ide.components.outline")
local callhierarchy = require("ide.components.callhierarchy")
local timeline = require("ide.components.timeline")
local terminal = require("ide.components.terminal")
local terminalbrowser = require("ide.components.terminal.terminalbrowser")
local changes = require("ide.components.changes")
local commits = require("ide.components.commits")
local branches = require("ide.components.branches")
local bookmarks = require("ide.components.bookmarks")

require("ide").setup({
	icon_set = "nerd",
	log_level = "info",
	components = {
		global_keymaps = {
			-- example, change all Component's hide keymap to "h"
			-- hide = h
		},
		-- example, prefer "x" for hide only for Explorer component.
		Explorer = {
      show_file_permissions = false,
		}
	},
	-- default panel groups to display on left and right.
	panels = {
		left = "explorer",
		right = "git",
    bottom = "terminal",
	},
	panel_groups = {
		explorer = {
			explorer.Name,
			outline.Name,
			-- bufferlist.Name,
			-- bookmarks.Name,
			-- callhierarchy.Name,
			-- terminalbrowser.Name,
		},
		-- terminal = { terminal.Name },
		git = {
			changes.Name,
			commits.Name,
			-- timeline.Name,
			branches.Name,
		},
	},
	-- workspaces config
	workspaces = {
		-- which panels to open by default: 'left', 'right', 'both', 'none'
		auto_open = "both",
	},
	-- default panel sizes for the different positions
	panel_sizes = {
		left = 30,
		right = 30,
		bottom = 15,
	},
})
