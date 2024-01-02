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

local webdev_dash_keywords = {
	"css",
	"cssmedia",
	"html",
	"htmle",
	"htmlhead",
	"httpheaders",
	"httpstatus",
	"js",
	"nextjs",
	"nodejs",
	"react",
	"scss",
	"ts",
}

-- TELESCOPE CONFIG
require("telescope").setup({
	color_devicons = true,
	prompt_prefix = "🔍 ",
	scroll_strategy = "cycle",
	sorting_strategy = "ascending",
	file_ignore_patterns = ignore_these,
	pickers = {
		find_files = {
			theme = "dropdown",
		},
	},
})

-- local builtin = function(mapping, picker, is_custom)
-- 	local module = is_custom and "plugins_settings.telescope" or "telescope.builtin"
-- 	local rhs = string.format([[<cmd>lua require'%s'.%s()<cr>]], module, picker)
-- 	vim.api.nvim_set_keymap("n", mapping, rhs, { noremap = true, silent = true })
-- end

-- builtin("<leader>ff", "find_files") -- Lists files in your current working directory, respects .gitignore
-- builtin("<leader>of", "oldfiles") -- Lists previously open files
-- Search word
-- builtin("<leader>fw", "current_buffer_fuzzy_find") -- Live fuzzy search inside of the currently open buffer

-- Git
-- Commits
-- builtin("<leader>gc", "git_commits")
-- Branches
-- builtin("<leader>gb", "git_branches")
-- Status
-- builtin("<leader>gs", "git_status")

-- Help
-- builtin("<leader>gh", "help_tags") -- Lists available help tags and opens a new window with the relevant help info on <cr>
-- Tabs (buffers)
-- builtin("<leader>bl", "buffers") -- Lists open buffers in current neovim instance

-- Functions
-- https://github.com/nvim-telescope/telescope.nvim#default-mappings

-- Mappings for the file preview
-- https://github.com/nvim-telescope/telescope.nvim#default-mappings
