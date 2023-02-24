if vim.g.vscode then
    require("keymappings")
    require("settings")
else
    -- aliases
    vim.g.mapleader = " "
    require("settings")
    require("keymappings")
    require("plugins")
    require("lsp")
    require("plugins_settings")
    require("color")
end

-- Mapping helper
-- local mapper = function(mode, key, result)
--   vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
-- end
