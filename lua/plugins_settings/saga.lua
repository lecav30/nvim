local lspsaga = require 'lspsaga'

lspsaga.setup { -- defaults ...
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
    virtual_text = true,
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
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  -- round, single, plus, double
  border_style = "round",
  rename_prompt_prefix = "➤",
  rename_output_qflist = {
    enable = false,
    auto_open_qflist = false,
  },
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix = false,
}

-- Mapping helper
local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

mapper("n", "gr", "<cmd>Lspsaga rename<CR>")
-- mapper("n", "gx", "<cmd>Lspsaga code_action<CR>")
-- mapper("x", "gx", ":<C-u>Lspsaga range_code_action<CR>")
mapper("n", "K", "<cmd>Lspsaga hover_doc<CR>")
-- mapper("n", "go", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- mapper("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- mapper("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- mapper("n", "<C-u>", "<cmd>Lspsaga require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<CR>")
-- mapper("n", "<C-d>", "<cmd>Lspsaga require('lspsaga.action').smart_scroll_with_saga(1, '<c-u>')<CR>")

