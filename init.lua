if vim.g.vscode then
    require("keymappings")
    require("settings")
else
    -- aliases
    local fn = vim.fn
    local cmd = vim.cmd

    -- Set leader key to space
    vim.g.mapleader = " "

    require("plugins")
    require("plugins_settings")
    require("lsp")
    require("keymappings")
    require("settings")
end

-- Mapping helper
-- local mapper = function(mode, key, result)
--   vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
-- end
