-- local plugin_config_root = 'plugins_settings.'
-- local plugin_config_files = {}, {}, {}

-- for _, plugin in ipairs(plugin_config_files) do
--   require(plugin_config_root .. plugin)
-- end

vim.g.mapleader = " "

require("plugins_settings.impatient")
require("plugins_settings.screen")
require("plugins_settings.devicons")
require("plugins_settings.neoformat")
require("plugins_settings.cmp")
require("plugins_settings.lspsaga")
require("plugins_settings.lualine")
require("plugins_settings.cokeline")
require("plugins_settings.nvimtree")
require("plugins_settings.telescope")
require("plugins_settings.treesitter")
require("plugins_settings.indent-blankline")
require("plugins_settings.nvim-autopairs")
require("plugins_settings.comment")
require("plugins_settings.material")
require("plugins_settings.presence")
require("plugins_settings.themer")
