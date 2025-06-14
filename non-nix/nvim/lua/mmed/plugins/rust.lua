return {
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			local crates = require("crates")
			local opts = { silent = true }

			crates.setup({
				lsp = {
					enabled = true,
					on_attach = function(client, bufnr)
						-- the same on_attach function as for your other lsp's
					end,
					actions = true,
					completion = true,
					hover = true,
				},
				completion = {
					cmp = {
						enabled = true,
					},
				},
			})

			vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
			vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
			vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)

			vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
		end,
	},
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
								id = "watches",
								size = 0.6,
							},
							{
								id = "scopes",
								size = 0.20,
							},
							{
								id = "breakpoints",
								size = 0.20,
							},
						},
						position = "left",
						size = 40,
					},
				},
			})

			vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<Cr>") -- "b" for toggle breakpoint
			vim.keymap.set("n", "<F3>", ":RustLsp runnables<Cr>")
			vim.keymap.set("n", "<F4>", ":RustLsp debuggables<Cr>")
			vim.keymap.set("n", "<F5>", ":DapContinue<Cr>")
			vim.keymap.set("n", "<F6>", ":DapStepOver<Cr>")
			vim.keymap.set("n", "<F7>", ":DapStepInto<Cr>")
			vim.keymap.set("n", "<F8>", ":DapStepOut<Cr>")
			vim.keymap.set("n", "<F9>", ":DapTerminate<Cr>")
			vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<Cr>")
			vim.keymap.set("n", "<C-k>", ":lua require('dapui').eval()<Cr>")

			vim.keymap.set("n", "<leader>re", ":RustLsp explainError current<Cr>")
			vim.keymap.set("n", "<leader>rd", ":RustLsp renderDiagnostic cycle<Cr>")
			vim.keymap.set("n", "<leader>rr", ":RustLsp runnables<Cr>")
			function ToggleLetMut()
				local line = vim.api.nvim_get_current_line()
				if string.match(line, "let mut") then
					line = string.gsub(line, "let mut", "let", 1)
				else
					line = string.gsub(line, "let", "let mut", 1)
				end
				vim.api.nvim_set_current_line(line)
			end
			vim.keymap.set("n", "<leader>rm", ToggleLetMut)
		end,
		version = "^4", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
