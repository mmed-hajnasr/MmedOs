return {
	{
		"xeluxee/competitest.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup({
				testcases_directory = "testcases_directory",
				replace_received_testcases = true,
				template_file = "$(HOME)/projects/ps/template.rs",
				received_files_extension = "rs",
				received_problems_path = "$(CWD)/src/bin/$(PROBLEM).$(FEXT)",
				received_contests_problems_path =("$(PROBLEM).$(FEXT)"):sub(0),
				received_contests_directory = "$(CWD)/src/bin",
				received_contests_prompt_directory = false,
				received_contests_prompt_extension = false,
			})
			vim.keymap.set("n", "<leader>tg", ":CompetiTest receive testcases<CR>", {})
			vim.keymap.set("n", "<leader>tr", ":CompetiTest run<CR>", {})
		end,
	},
}
