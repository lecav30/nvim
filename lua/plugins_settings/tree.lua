require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  -- auto_close          = true,
  -- The property auto_close was removed
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  -- update_to_buf_dir   = {
  --   enable = true,
  --   auto_open = true,
  -- },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'right',
    -- auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

-- Mapping helper
local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

mapper("n", "<Leader>e", ":NvimTreeToggle<CR>")
mapper("n", ",r", ":NvimTreeRefresh<CR>")
