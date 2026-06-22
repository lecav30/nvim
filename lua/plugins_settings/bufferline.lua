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
	local blue = hl_fg("Function", "#78a9ff")
	local surface = hl_bg("StatusLineNC", blend(fg, bg, 0.12))
	local surface_active = blend(blue, bg, 0.22)
	local surface_visible = blend(fg, bg, 0.18)

	return {
		bg = bg,
		fg = fg,
		muted = hl_fg("Comment", blend(fg, bg, 0.45)),
		surface = surface,
		surface_active = surface_active,
		surface_visible = surface_visible,
		blue = blue,
		yellow = hl_fg("DiagnosticWarn", "#f1c21b"),
		red = hl_fg("DiagnosticError", "#ee5396"),
	}
end

local function highlights()
	local colors = palette()

	return {
		fill = { bg = colors.bg },

		background = { fg = colors.muted, bg = colors.surface },
		buffer_visible = { fg = colors.fg, bg = colors.surface_visible },
		buffer_selected = { fg = colors.blue, bg = colors.surface_active, bold = true, italic = false },

		close_button = { fg = colors.muted, bg = colors.surface },
		close_button_visible = { fg = colors.fg, bg = colors.surface_visible },
		close_button_selected = { fg = colors.blue, bg = colors.surface_active },

		modified = { fg = colors.yellow, bg = colors.surface },
		modified_visible = { fg = colors.yellow, bg = colors.surface_visible },
		modified_selected = { fg = colors.bg, bg = colors.yellow, bold = true },

		separator = { fg = colors.bg, bg = colors.surface },
		separator_visible = { fg = colors.bg, bg = colors.surface_visible },
		separator_selected = { fg = colors.bg, bg = colors.surface_active },

		indicator_selected = { fg = colors.blue, bg = colors.surface_active },

		error = { fg = colors.red, bg = colors.surface },
		error_visible = { fg = colors.red, bg = colors.surface_visible },
		error_selected = { fg = colors.bg, bg = colors.red, bold = true },

		warning = { fg = colors.yellow, bg = colors.surface },
		warning_visible = { fg = colors.yellow, bg = colors.surface_visible },
		warning_selected = { fg = colors.bg, bg = colors.yellow, bold = true },
	}
end

local function setup()
	require("bufferline").setup({
		highlights = highlights(),
		options = {
			separator_style = "thick",
			sort_by = "insert_after_current",
		},
	})
end

setup()

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("BufferlineColors", { clear = true }),
	callback = setup,
})
