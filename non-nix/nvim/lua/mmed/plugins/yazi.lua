return {
	{
		"Eandrju/cellular-automaton.nvim",
		config = function()
			vim.keymap.set("n", "<leader>ad", "<cmd>CellularAutomaton make_it_rain<CR>")
			vim.keymap.set("n", "<leader>as", "<cmd>CellularAutomaton scramble<CR>")
		end,
	},
	{
		"DreamMaoMao/yazi.nvim",
		lazy = false,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},

		keys = {
			{ "<leader>h", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
		},
	},
}
