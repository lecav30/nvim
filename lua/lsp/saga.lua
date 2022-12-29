local lspsaga = require "lspsaga"

lspsaga.setup {
    debug = false,
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    diagnostic_header_icon = "   ",
    -- code action title icon
    code_action_icon = " ",
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true
    },
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>"
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>"
    },
    rename_action_keys = {
        quit = "<C-c>",
        exec = "<CR>"
    },
    definition_preview_icon = "  ",
    border_style = "single",
    rename_prompt_prefix = "➤",
    rename_output_qflist = {
        enable = false,
        auto_open_qflist = false
    },
    server_filetype_map = {},
    diagnostic_prefix_format = "%d. ",
    diagnostic_message_format = "%m %c",
    highlight_prefix = false
}

--- In lsp attach function
local keymap = vim.keymap.set

-- Rename
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", {silent = true})
-- Code action
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", {silent = true})
-- Range code action (visual mode)
keymap("x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true})
-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", {silent = true})
-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
-- Show cursor diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
-- Jump diagnostic next
keymap("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true})
-- Jump diagnostic previous
keymap("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true})
-- Finder
keymap("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {silent = true})
-- Float terminal
-- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })

keymap("n", "<c-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
keymap("n", "<c-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
