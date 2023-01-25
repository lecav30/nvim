local wk = require("which-key")

wk.register(
    {
        ["<leader>"] = {
            b = {
                name = "+buffer",
                l = {"<cmd>Telescope buffers<cr>", "Buffers"},
                d = {"<cmd>bdelete<cr>", "Delete Buffer"},
                s = {"<cmd>split<cr>", "Split Buffer"},
                v = {"<cmd>vsplit<cr>", "VSplit Buffer"}
            },
            c = {
                name = "+code",
                a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
                d = {"Code Diagnostics"},
                l = {"Comment Line"}
            },
            e = {"Explorer"},
            f = {
                name = "+find",
                f = {"<cmd>Telescope find_files<cr>", "Find File"},
                w = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find Word"},
                n = {"<cmd>Neoformat<cr>", "Format code"}
            },
            g = {
                name = "+git & lsp",
                b = {"<cmd>Telescope git_branches<cr>", "Git Branches"},
                c = {"<cmd>Telescope git_commits<cr>", "Git Commits"},
                s = {"<cmd>Telescope git_status<cr>", "Git Status"},
                h = {"<cmd>Telescope help_tags<cr>", "Help Tags"},
                D = {"Go to Declaration"},
                d = {"Go to Definition"},
                i = {"Go to Implementation"}
            },
            of = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
            q = {"Quit"},
            rn = {"<cmd>Lspsaga rename<cr>", "Rename"},
            w = {
                name = "+save",
                w = {"Save file"},
                a = {"Save all files"},
                q = {"Save all files and quit"}
            },
            v = {
                name = "+vimtex",
                v = {"<cmd>VimtexView<cr>", "View"},
                e = {"<cmd>VimtexErrors<cr>", "Errors"},
                c = {"<cmd>VimtexCompile<cr>", "Compile"},
                s = {"<cmd>VimtexStatus<cr>", "Status"},
                t = {"<cmd>VimtexStop<cr>", "Stop"},
            }
        }
    }
)
