return {
	---------------------------------------------------------------------------------
	------------------------------- File explorer -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		cmd = "Telescope",
		keys = {
			{ "<leader><leader>", "<cmd>Telescope builtin<cr>", desc = "Find Pickers" },
			{ "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
			{ "<leader>ce", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
			{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
			{ "<leader>gx", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
		},
		config = function()
			require("plugins_settings.telescope")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-tree/nvim-web-devicons", -- Icons for nerd fonts
		},
	}, -- Telescope
	{
		"dmtrKovalenko/fff.nvim",
		build = function()
			require("fff.download").download_or_build_binary()
		end,
		opts = {},
		lazy = false, -- the plugin lazy-initialises itself
		keys = {
			{
				"<leader>ff",
				function()
					require("fff").find_files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("fff").live_grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>fz",
				function()
					require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
				end,
				desc = "Fuzzy Live Grep",
			},
			{
				"<leader>fw",
				function()
					require("fff").live_grep_under_cursor()
				end,
				mode = { "n", "x" },
				desc = "Search Word or Selection",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Oil",
		keys = {
			{ "<leader>e", "<cmd>Oil<cr>", desc = "Oil Explorer" },
		},
		opts = {},
	},
	---------------------------------------------------------------------------------
	------------------------------- Search engine -----------------------------------
	---------------------------------------------------------------------------------
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Spectre",
		keys = {
			{
				"<leader>s",
				function()
					require("spectre").toggle()
				end,
				desc = "Toggle Spectre",
			},
		},
		opts = {},
	},
}
