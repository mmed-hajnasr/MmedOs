return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					hidden = true,
					no_ignore = true,
					mappings = {
						i = {
							["<Tab>"] = "move_selection_previous",
							["<S-Tab>"] = "move_selection_next",
						},
					},
					-- configure to use ripgrep
					vimgrep_arguments = {
						"rg",
						"--follow", -- Follow symbolic links
						"--hidden", -- Search for hidden files
						"--line-number", -- Show line numbers
						"--column", -- Show column numbers
						"--smart-case", -- Smart case search
						-- Exclude some patterns from search
						"--glob=!**/.git/*",
						"--glob=!**/build/*",
						"--glob=!**/target/*",
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = true,
						-- needed to exclude some files & dirs from general search
						-- when not included or specified in .gitignore
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--glob=!**/.git/*",
							"--glob=!**/build/*",
							"--glob=!**/target/*",
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fs", function()
				builtin.grep_string({ search = vim.fn.input("search > ") })
			end)
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
