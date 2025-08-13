local conditions = require("heirline.conditions")
local heirline = require("heirline.utils")

local os_sep = package.config:sub(1, 1)
local api = vim.api
local fn = vim.fn
local bo = vim.bo

local util = require("plugins_settings.util")
local icons = util.icons

local Space = {
	provider = "  ",
}

local priority = {
	CurrentPath = 60,
	Git = 40,
	WorkDir = 25,
	Lsp = 10,
}

local ViMode = {
	init = function(self)
		self.mode = vim.fn.mode(1)
	end,
	static = {
		mode_names = {
			n = "N",
			no = "N?",
			nov = "N?",
			noV = "N?",
			["no\22"] = "N?",
			niI = "Ni",
			niR = "Nr",
			niV = "Nv",
			nt = "Nt",
			v = "V",
			vs = "Vs",
			V = "V_",
			Vs = "Vs",
			["\22"] = "^V",
			["\22s"] = "^V",
			s = "S",
			S = "S_",
			["\19"] = "^S",
			i = "I",
			ic = "Ic",
			ix = "Ix",
			R = "R",
			Rc = "Rc",
			Rx = "Rx",
			Rv = "Rv",
			Rvc = "Rv",
			Rvx = "Rv",
			c = "C",
			cv = "Ex",
			r = "...",
			rm = "M",
			["r?"] = "?",
			["!"] = "!",
			t = "T",
		},
		mode_colors = {
			n = "red",
			i = "green",
			v = "cyan",
			V = "cyan",
			["\22"] = "cyan",
			c = "orange",
			s = "purple",
			S = "purple",
			["\19"] = "purple",
			R = "orange",
			r = "orange",
			["!"] = "red",
			t = "red",
		},
	},
	provider = function(self)
		return " %2(" .. self.mode_names[self.mode] .. "%)"
	end,
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = function()
			vim.cmd("redrawstatus")
		end,
	},
}

local Git
do
	local GitBranch = {
		condition = conditions.is_git_repo,
		init = function(self)
			self.git_status = vim.b.gitsigns_status_dict
		end,
		provider = function(self)
			return table.concat({ " ", self.git_status.head })
		end,
	}

	local GitChanges = {
		condition = function(self)
			if conditions.is_git_repo() and vim.b.gitsigns_status_dict then
				self.git_status = vim.b.gitsigns_status_dict
				local has_changes = self.git_status.added ~= 0
					or self.git_status.removed ~= 0
					or self.git_status.changed ~= 0
				return has_changes
			end
			return false
		end,
		provider = function(self)
			local added = self.git_status.added or 0
			local removed = self.git_status.removed or 0
			local changed = self.git_status.changed or 0

			local changes = {}
			if added > 0 then
				table.insert(changes, "+" .. added)
			end
			if removed > 0 then
				table.insert(changes, "-" .. removed)
			end
			if changed > 0 then
				table.insert(changes, "~" .. changed)
			end

			return table.concat(changes, " ")
		end,
	}

	Git = { GitBranch, Space, GitChanges, Space }
end

local Lsp
do
	local LspIndicator = {
		provider = icons.circle_small .. " ",
	}

	local LspServer = {
		Space,
		{
			provider = function(self)
				local names = self.lsp_names
				if #names == 1 then
					names = names[1]
				else
					names = table.concat(names, ", ")
				end
				return names
			end,
		},
		Space,
	}

	Lsp = {
		condition = conditions.lsp_attached,
		init = function(self)
			local names = {}
			for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
				table.insert(names, server.name)
			end
			self.lsp_names = names
		end,

		LspServer,
		LspIndicator,
	}
end

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
})

local Diagnostics = {
	condition = conditions.has_diagnostics,
	static = {
		error_icon = " ",
		warn_icon = " ",
		info_icon = " ",
		hint_icon = " ",
	},
	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,
	{
		provider = function(self)
			if self.errors > 0 then
				return table.concat({ self.error_icon, self.errors, " " })
			end
		end,
	},
	{
		provider = function(self)
			if self.warnings > 0 then
				return table.concat({ self.warn_icon, self.warnings, " " })
			end
		end,
	},
	{
		provider = function(self)
			if self.info > 0 then
				return table.concat({ self.info_icon, self.info, " " })
			end
		end,
	},
	{
		provider = function(self)
			if self.hints > 0 then
				return table.concat({ self.hint_icon, self.hints, " " })
			end
		end,
	},
	Space,
}

local Ruler = {
	provider = "%7(%l/%3L%):%2c %P",
}

local ScrollBar = {
	static = {
		sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
	},
	provider = function(self)
		local curr_line = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_line_count(0)
		local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
		return string.rep(self.sbar[i], 2)
	end,
}

require("heirline").setup({
	statusline = {
		{ Space, ViMode, Space, Git, Ruler, Space, ScrollBar, Space, Lsp, Diagnostics },
	},
	-- opts = {
	-- 	colors = colors,
	-- },
})
