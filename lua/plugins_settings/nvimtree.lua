require("nvim-tree").setup(
    {
        -- Keep the cursor on the first letter of the file
        hijack_cursor = true,
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true,
            side = "right"
        },
        renderer = {
            indent_markers = {
                enable = true
            }
        },
        filters = {
            dotfiles = true
        },
        -- diagnostics of lsp
        diagnostics = {
            enable = true,
            show_on_dirs = false
        },
        git = {
            ignore = false
        },
    }
)

local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

mapper("n", "<Leader>e", ":NvimTreeToggle<CR>")
