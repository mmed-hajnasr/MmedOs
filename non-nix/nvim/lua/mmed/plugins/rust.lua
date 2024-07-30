return {
	{
		"mrcjkb/rustaceanvim",
		event = "BufRead",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap",
			"nvim-telescope/telescope-dap.nvim",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup({
				controls = {
					element = "breakpoints",
					enabled = true,
				},
				icons = {
					collapsed = ">",
					current_frame = ">",
					expanded = "",
				},
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.75,
							},
							{
								id = "breakpoints",
								size = 0.25,
							},
						},
						position = "left",
						size = 40,
					},
					{
						elements = {
							{
								id = "watches",
								size = 0.5,
							},
						},
						position = "bottom",
						size = 10,
					},
				},
			})

			vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<Cr>") -- "b" for toggle breakpoint
			vim.keymap.set("n", "<F5>", ":RustLsp debuggables<Cr>")
			vim.keymap.set("n", "<F6>", ":DapStepOver<Cr>")
			vim.keymap.set("n", "<F7>", ":DapStepInto<Cr>")
			vim.keymap.set("n", "<F8>", ":DapStepOut<Cr>")
			vim.keymap.set("n", "<F9>", ":DapTerminate<Cr>")
			vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<Cr>")
			vim.keymap.set("n", "<C-k>", ":lua require('dapui').eval()<Cr>")

			vim.keymap.set("n", "<leader>re", ":RustLsp explainError current<Cr>")
			vim.keymap.set("n", "<leader>rd", ":RustLsp renderDiagnostic cycle<Cr>")
			vim.keymap.set("n", "<leader>rr", ":RustLsp runnables<Cr>")
		end,
		version = "^4", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
