local ignore_these = {
	"node_modules/.*",
	".git/.*",
	".yarn/.*",
	".neuron/*",
	"fonts/*",
	"icons/*",
	"images/*",
	"dist/*",
	"build/*",
	"yarn.lock",
	"package%-lock.json",
}

local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions
local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1
local vimfnameescape = vim.fn.fnameescape
local winfnameescape = function(path)
	local escaped_path = vimfnameescape(path)
	if is_windows then
		local need_extra_esc = path:find("[%[%]`%$~]")
		local esc = need_extra_esc and "\\\\" or "\\"
		escaped_path = escaped_path:gsub("\\[%(%)%^&;]", esc .. "%1")
		if need_extra_esc then
			escaped_path = escaped_path:gsub("\\\\['` ]", "\\%1")
		end
	end
	return escaped_path
end

local select_default = function(prompt_bufnr)
	vim.fn.fnameescape = winfnameescape
	local result = actions.select_default(prompt_bufnr, "default")
	vim.fn.fnameescape = vimfnameescape
	return result
end

-- TELESCOPE CONFIG
require("telescope").setup({
	defaults = {
		path_display = { "smart" },
		cwd = vim.loop.cwd(),
		mappings = {
			i = {
				["<cr>"] = select_default,
			},
			n = {
				["<cr>"] = select_default,
			},
		},
	},
	color_devicons = true,
	scroll_strategy = "cycle",
	sorting_strategy = "ascending",
	file_ignore_patterns = ignore_these,
	pickers = {
		buffers = {
			previewer = false,
			initial_mode = "normal",
			theme = "dropdown",
		},
		find_files = {
			layout_config = {
				prompt_position = "top",
				width = 0.70,
				height = 0.90,
			},
			layout_strategy = "vertical",
			theme = "dropdown",
		},
		live_grep = {
			layout_config = {
				prompt_position = "top",
				width = 0.70,
				height = 0.90,
			},
			layout_strategy = "vertical",
			theme = "dropdown",
		},
		diagnostics = {
			theme = "ivy",
			initial_mode = "normal",
			layout_config = {
				preview_cutoff = 9999,
			},
		},
	},
	extensions = {
		-- TELESCOPE FILE BROWSER
		file_browser = {
			path = "%:p:h",
			cwd = telescope_buffer_dir(),
			respect_gitignore = false,
			previewer = false,
			initial_mode = "normal",
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["n"] = {
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					-- your custom normal mode mappings
					["/"] = function()
						vim.cmd("startinsert")
					end,
					["<C-u>"] = function(prompt_bufnr)
						for i = 1, 10 do
							actions.move_selection_previous(prompt_bufnr)
						end
					end,
					["<C-d>"] = function(prompt_bufnr)
						for i = 1, 10 do
							actions.move_selection_next(prompt_bufnr)
						end
					end,
				},
			},
		},
		find_pickers = {},
	},
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("find_pickers")
require("telescope").load_extension("notify")
-- require("telescope").load_extension("dap")

-- Functions
-- https://github.com/nvim-telescope/telescope.nvim#default-mappings

-- Mappings for the file preview
-- https://github.com/nvim-telescope/telescope.nvim#default-mappings
