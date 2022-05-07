require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- Square
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    --
    -- Circle
    -- section_separators = { left = '', right = ''},
    -- component_separators = { left = '', right = ''},

    disabled_filetypese= {},
    always_divide_middle = true,
    symbols = {
        added = '+',
        modified = '~',
        removed = '-',
        unix = '',
        dos = '',
        mac = '',
        error = 'E',
        warn = 'W',
        info = 'I',
        hint = 'H'
    },  
    colored = true,
    source = nil,
  },
  sections = {
    lualine_a = { 'mode', 'branch'},
    lualine_b = {
        {
            'diagnostics',
            sources = {'nvim_diagnostic'},
            sections = {'error', 'warn', 'info', 'hint'},
            diagnostics_color = {
                error = 'DiagnosticError', 
                warn  = 'DiagnosticWarn',  
                info  = 'DiagnosticInfo',
                hint  = 'DiagnosticHint',
            },
            update_in_insert = false,
            always_visible = false,
        }
  },
  lualine_c = { "require'lsp-status'.status()" },
  lualine_x = { 
      {
          'diff',
          diff_color = {
              added    = 'DiffAdd',
              modified = 'DiffChange',
              removed  = 'DiffDelete',
          },
      }
  },
    lualine_y = { 'progress' },
    lualine_z = { "os.date('%F')", 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}

