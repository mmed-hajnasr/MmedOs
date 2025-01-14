return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			local ts = require("telescope")
			local ts_undo = require("telescope-undo.actions")
			local h_pct = 0.90
			local w_pct = 0.80
			local w_limit = 75
			local standard_setup = {
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				preview = { hide_on_startup = true },
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						mirror = true,
						prompt_position = "top",
						width = function(_, cols, _)
							return math.min(math.floor(w_pct * cols), w_limit)
						end,
						height = function(_, _, rows)
							return math.floor(rows * h_pct)
						end,
						preview_cutoff = 10,
						preview_height = 0.4,
					},
				},
			}
			local fullscreen_setup = {
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				preview = { hide_on_startup = false },
				layout_strategy = "flex",
				layout_config = {
					flex = { flip_columns = 100 },
					horizontal = {
						mirror = false,
						prompt_position = "top",
						width = function(_, cols, _)
							return math.floor(cols * w_pct)
						end,
						height = function(_, _, rows)
							return math.floor(rows * h_pct)
						end,
						preview_cutoff = 10,
						preview_width = 0.5,
					},
					vertical = {
						mirror = true,
						prompt_position = "top",
						width = function(_, cols, _)
							return math.floor(cols * w_pct)
						end,
						height = function(_, _, rows)
							return math.floor(rows * h_pct)
						end,
						preview_cutoff = 10,
						preview_height = 0.5,
					},
				},
			}
			ts.setup({
				defaults = vim.tbl_extend("error", standard_setup, {
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
					sorting_strategy = "ascending",
					path_display = { "filename_first" },
					mappings = {
						n = {
							["o"] = require("telescope.actions.layout").toggle_preview,
						},
						i = {
							["<S-Tab>"] = "move_selection_previous",
							["<Tab>"] = "move_selection_next",
							["<C-o>"] = require("telescope.actions.layout").toggle_preview,
						},
					},
				}),
				pickers = {
					find_files = {
						hidden = true,
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
					undo = vim.tbl_extend("error", fullscreen_setup, {
						vim_diff_opts = { ctxlen = 4 },
						preview_title = "Diff",
						mappings = {
							i = {
								["<cr>"] = ts_undo.restore,
								["<C-cr>"] = ts_undo.restore,
								["<C-y>d"] = ts_undo.yank_deletions,
								["<C-y>a"] = ts_undo.yank_additions,
							},
							n = {
								["<cr>"] = ts_undo.restore,
								["ya"] = ts_undo.yank_additions,
								["yd"] = ts_undo.yank_deletions,
							},
						},
					}),
				},
			})
			ts.load_extension("undo")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>tu", ":Telescope undo") -- "b" for toggle breakpoint
			-- vim.keymap.set("n", "<leader>fa", builtin.git_files, {})
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		end,
	},
}
