return {
	{
		"kevinhwang91/nvim-bqf",
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle focus=true<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>tt",
				"<cmd>Trouble todo toggle focus=true<cr>",
				desc = "Todo (Trouble)",
			},
		},
	},
}
