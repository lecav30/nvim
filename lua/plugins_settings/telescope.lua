-- files to ignore with `file_ignore_patterns`
local ignore_these = {
  'node_modules/.*',
  '.git/.*',
  '.yarn/.*',
  '.neuron/*',
  'fonts/*',
  'icons/*',
  'images/*',
  'dist/*',
  'build/*',
  'yarn.lock',
  'package%-lock.json',
}

local webdev_dash_keywords = {
  'css',
  'cssmedia',
  'html',
  'htmle',
  'htmlhead',
  'httpheaders',
  'httpstatus',
  'js',
  'nextjs',
  'nodejs',
  'react',
  'scss',
  'ts',
}

-- TELESCOPE CONFIG
require('telescope').setup {
    color_devicons = true,
    prompt_prefix = '🔍 ',
    scroll_strategy = 'cycle',
    sorting_strategy = 'ascending',
    file_ignore_patterns = ignore_these,
    layout_config = {
      prompt_position = 'top',
      horizontal = {
        mirror = true,
        preview_cutoff = 100,
        preview_width = 0.5,
      },
      vertical = {
        mirror = true,
        preview_cutoff = 0.4,
      },
      flex = {
        flip_columns = 110,
      },
      height = 0.94,
      width = 0.86,
  },
}

local builtin = function(mapping, picker, is_custom)
  local module = is_custom and 'plugins_settings.telescope' or 'telescope.builtin'
  local rhs = string.format([[<cmd>lua require'%s'.%s()<cr>]], module, picker)
  vim.api.nvim_set_keymap('n', mapping, rhs, { noremap = true, silent = true })
end

builtin('<leader>ff', 'find_files') -- Lists files in your current working directory, respects .gitignore
-- builtin('<leader>fb', 'file_browser') 
builtin('<leader>of', 'oldfiles') -- Lists previously open files
-- builtin('<leader>fw', 'grep_string') -- Searches for the string under your cursor in your current working directory
-- builtin('<leader>gw', 'live_grep') -- Search for a string in your current working directory and get results live as you type (respecting .gitignore)
-- Search word
builtin('<leader>gib', 'current_buffer_fuzzy_find') -- Live fuzzy search inside of the currently open buffer
-- Git 
builtin('<leader>gl', 'git_commits') -- Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
builtin('<leader>gb', 'git_branches') -- Lists all branches with log preview, checkout action <cr>, track action <C-t> and rebase action<C-r>
-- Help
builtin('<leader>gh', 'help_tags') -- Lists available help tags and opens a new window with the relevant help info on <cr>
-- builtin('<leader>gm', 'man_pages') -- Lists manpage entries, opens them in a help window on <cr>
-- Tabs (buffers)
builtin('<leader>bl', 'buffers') -- Lists open buffers in current neovim instance
-- Help wih commands
builtin('<leader>ts', 'builtin') -- Lists Built-in pickers and run them on <cr>.
-- Reload modules
builtin('<leader>rp', 'reloader') -- Lists Lua modules and reload them on <cr>.
-- Telescope previous
-- builtin('<leader>tp', 'resume') --  Lists the results incl. multi-selections of the previous picker
-- builtin('<leader>ps', 'lsp_dynamic_workspace_symbols') -- Dynamically Lists LSP for all workspace symbols
builtin('<leader>ca', 'lsp_code_actions') -- Lists any LSP actions for the word under the cursor, that can be triggered with <cr>

-- Functions
-- https://github.com/nvim-telescope/telescope.nvim#default-mappings

-- Mappings for the file preview
-- https://github.com/nvim-telescope/telescope.nvim#default-mappings
