return {
	---------------------------------------------------------------------------------
	-------------------------------- VimFeatures ------------------------------------
	---------------------------------------------------------------------------------
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	}, -- Autopairs
	{
		"kevinhwang91/nvim-ufo",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = "kevinhwang91/promise-async",
		init = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
		opts = {
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		},
		keys = {
			{
				"zR",
				function()
					require("ufo").openAllFolds()
				end,
				desc = "Open All Folds",
			},
			{
				"zM",
				function()
					require("ufo").closeAllFolds()
				end,
				desc = "Close All Folds",
			},
		},
	}, -- Fold
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins_settings.noice")
		end,
		dependencies = {
			"rcarriga/nvim-notify",
		},
	}, -- Notifications
	---------------------------------------------------------------------------------
	------------------------------------ Git ----------------------------------------
	---------------------------------------------------------------------------------
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, {
						buffer = bufnr,
						desc = desc,
					})
				end

				map("n", "]h", function()
					gs.nav_hunk("next")
				end, "Next Git Hunk")

				map("n", "[h", function()
					gs.nav_hunk("prev")
				end, "Previous Git Hunk")

				map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>gh", gs.stage_hunk, "Stage/Unstage Hunk")
				map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")

				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, "Blame Line")

				map("n", "<leader>gB", gs.blame, "Blame buffer")

				map({ "o", "x" }, "ih", gs.select_hunk, "Git Hunk")
			end,
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			attach_to_untracked = true,
			current_line_blame = true,
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			preview_config = {
				border = "single",
			},
		},
	}, -- Git signs
	---------------------------------------------------------------------------------
	------------------------------------ Zen ----------------------------------------
	---------------------------------------------------------------------------------
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		keys = {
			{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
		},
	}, -- Zen mode
	---------------------------------------------------------------------------------
	---------------------------------- Harpoon --------------------------------------
	---------------------------------------------------------------------------------
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>a",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Add File to Harpoon",
			},
			{
				"<leader>dr",
				function()
					require("harpoon"):list():remove()
				end,
				desc = "Remove File from Harpoon",
			},
			{
				"<leader>dC",
				function()
					require("harpoon"):list():clear()
				end,
				desc = "Clear Harpoon Marks",
			},
			{
				"<leader>h",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon Quick Menu",
			},
			{
				"<leader>fh",
				function()
					require("plugins_settings.harpoon").toggle_telescope()
				end,
				desc = "Find Harpoon Files",
			},
			{
				"<leader>1",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon File 1",
			},
			{
				"<leader>2",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon File 2",
			},
			{
				"<leader>3",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon File 3",
			},
			{
				"<leader>4",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon File 4",
			},
		},
		config = function()
			require("plugins_settings.harpoon").setup()
		end,
	},
	---------------------------------------------------------------------------------
	----------------------------------- Motion --------------------------------------
	---------------------------------------------------------------------------------
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}
