---------------------------------------------------------------------------------
----------------------------------- Debug ---------------------------------------
---------------------------------------------------------------------------------
return {
	"mfussenegger/nvim-dap", -- DAP
	"theHamsta/nvim-dap-virtual-text", -- DAP Virtual Text
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	}, -- DAP UI
	"jay-babu/mason-nvim-dap.nvim", -- Mason DAP
}
