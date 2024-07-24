return {
	{
		"xeluxee/competitest.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup({
				replace_received_testcases = true,
				testcases_use_single_file = true,
				template_file = "$(HOME)/projects/ps/template.rs",
				received_files_extension = "rs",
			})
			vim.keymap.set("n", "<leader>tg", ":CompetiTest receive testcases<CR>", {})
			vim.keymap.set("n", "<leader>tr", ":CompetiTest run<CR>", {})
		end,
	},
}
