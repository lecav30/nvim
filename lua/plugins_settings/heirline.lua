local conditions = require("heirline.conditions")

local util = require("plugins_settings.util")
local icons = util.icons

local function hex(value)
	if not value then
		return nil
	end
	return string.format("#%06x", value)
end

local function hl(name)
	local ok, value = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
	return ok and value or {}
end

local function hl_fg(name, fallback)
	return hex(hl(name).fg) or fallback
end

local function hl_bg(name, fallback)
	return hex(hl(name).bg) or fallback
end

local function blend(fg, bg, alpha)
	fg = tonumber(fg:sub(2), 16)
	bg = tonumber(bg:sub(2), 16)

	local function channel(offset)
		local fg_channel = math.floor(fg / offset) % 256
		local bg_channel = math.floor(bg / offset) % 256
		return math.floor((alpha * fg_channel) + ((1 - alpha) * bg_channel))
	end

	return string.format("#%02x%02x%02x", channel(0x10000), channel(0x100), channel(0x1))
end

local function palette()
	local bg = hl_bg("Normal", "#161616")
	local fg = hl_fg("Normal", "#dde1e6")
	local surface = hl_bg("StatusLineNC", blend(fg, bg, 0.12))

	return {
		bg = bg,
		fg = fg,
		surface = surface,
		muted = hl_fg("Comment", blend(fg, bg, 0.45)),
		blue = hl_fg("Function", "#78a9ff"),
		cyan = hl_fg("DiagnosticInfo", "#33b1ff"),
		green = hl_fg("GitSignsAdd", "#42be65"),
		orange = hl_fg("String", "#ffab91"),
		purple = hl_fg("Keyword", "#be95ff"),
		red = hl_fg("DiagnosticError", "#ee5396"),
		yellow = hl_fg("DiagnosticWarn", "#f1c21b"),
		hint = hl_fg("DiagnosticHint", fg),
		git_change = hl_fg("GitSignsChange", "#33b1ff"),
		git_delete = hl_fg("GitSignsDelete", "#ee5396"),
	}
end

local function semantic_hl(color_name)
	return function()
		local colors = palette()
		return { fg = colors.bg, bg = colors[color_name], bold = true }
	end
end

local function surface_hl()
	local colors = palette()
	return { fg = colors.fg, bg = colors.surface }
end

local Space = {
	provider = " ",
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
			n = "blue",
			i = "green",
			v = "purple",
			V = "purple",
			["\22"] = "purple",
			c = "orange",
			s = "cyan",
			S = "cyan",
			["\19"] = "cyan",
			R = "red",
			r = "red",
			["!"] = "red",
			t = "green",
		},
	},
	provider = function(self)
		return "  %2(" .. self.mode_names[self.mode] .. "%) "
	end,
	hl = function(self)
		local colors = palette()
		local color = self.mode_colors[self.mode] or "blue"
		return { fg = colors.bg, bg = colors[color], bold = true }
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
			return table.concat({ "  ", self.git_status.head, " " })
		end,
		hl = surface_hl,
	}

	local GitAdded = {
		condition = function(self)
			return self.git_status and (self.git_status.added or 0) > 0
		end,
		provider = function(self)
			return " +" .. self.git_status.added .. " "
		end,
		hl = semantic_hl("green"),
	}

	local GitChanged = {
		condition = function(self)
			return self.git_status and (self.git_status.changed or 0) > 0
		end,
		provider = function(self)
			return " ~" .. self.git_status.changed .. " "
		end,
		hl = semantic_hl("git_change"),
	}

	local GitRemoved = {
		condition = function(self)
			return self.git_status and (self.git_status.removed or 0) > 0
		end,
		provider = function(self)
			return " -" .. self.git_status.removed .. " "
		end,
		hl = semantic_hl("git_delete"),
	}

	Git = {
		condition = function()
			return conditions.is_git_repo() and vim.b.gitsigns_status_dict
		end,
		init = function(self)
			self.git_status = vim.b.gitsigns_status_dict
		end,
		update = { "User", pattern = "GitSignsUpdate" },
		GitBranch,
		GitAdded,
		GitChanged,
		GitRemoved,
	}
end

local Lsp
do
	local LspServer = {
		provider = function(self)
			local names = self.lsp_names
			if #names == 1 then
				names = names[1]
			else
				names = table.concat(names, ", ")
			end
			return " " .. icons.circle_small .. " " .. names .. " "
		end,
		hl = semantic_hl("cyan"),
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
		update = { "LspAttach", "LspDetach" },
		LspServer,
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
		error_icon = "",
		warn_icon = "",
		info_icon = "",
		hint_icon = "",
	},
	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,
	update = { "DiagnosticChanged", "BufEnter" },
	{
		provider = function(self)
			if self.errors > 0 then
				return " " .. self.error_icon .. " " .. self.errors .. " "
			end
		end,
		hl = semantic_hl("red"),
	},
	{
		provider = function(self)
			if self.warnings > 0 then
				return " " .. self.warn_icon .. " " .. self.warnings .. " "
			end
		end,
		hl = semantic_hl("yellow"),
	},
	{
		provider = function(self)
			if self.info > 0 then
				return " " .. self.info_icon .. " " .. self.info .. " "
			end
		end,
		hl = semantic_hl("cyan"),
	},
	{
		provider = function(self)
			if self.hints > 0 then
				return " " .. self.hint_icon .. " " .. self.hints .. " "
			end
		end,
		hl = semantic_hl("hint"),
	},
}

local Ruler = {
	provider = "%7(%l/%3L%):%2c %P ",
	hl = surface_hl,
}

local ScrollBar = {
	static = {
		sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
	},
	provider = function(self)
		local curr_line = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_line_count(0)
		local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
		return " " .. string.rep(self.sbar[i], 2) .. " "
	end,
	hl = semantic_hl("purple"),
}

local Align = { provider = "%=" }

require("heirline").setup({
	statusline = {
		ViMode,
		Space,
		Git,
		Align,
		Lsp,
		Diagnostics,
		Space,
		Ruler,
		ScrollBar,
	},
})
