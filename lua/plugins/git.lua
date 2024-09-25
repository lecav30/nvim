---------------------------------------------------------------------------------
------------------------------------ Git ----------------------------------------
---------------------------------------------------------------------------------
return {
	"lewis6991/gitsigns.nvim", -- Git signs
	"wintermute-cell/gitignore.nvim", -- Gitignore
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
