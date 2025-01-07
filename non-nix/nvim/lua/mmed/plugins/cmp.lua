return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
			"rafamadriz/friendly-snippets", -- useful snippets
			"onsails/lspkind.nvim", -- vs-code like pictograms
		},
		config = function()
			local cmp = require("cmp")

			local snippy = require("snippy")

			local lspkind = require("lspkind")

			snippy.setup({
				snippet_dirs = "~/.config/nvim/snippets",
				local_snippet_dir = ".snippets",
				enable_auto = true,
				mappings = {
					is = {
						["<S-Tab>"] = "next",
					},
					nx = {
						["<leader>x"] = "cut_text",
					},
				},
				expand_options = {
					m = function()
						return vim.fn["vimtex#syntax#in_mathzone"]() == 1
					end,
				},
			})

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				completion = {
					completeopt = "menu,menuone,preview",
				},
				snippet = { -- configure how nvim-cmp interacts with snippet engine
					expand = function(args)
						snippy.expand_snippet(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.close(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if snippy.can_jump(1) then
							snippy.next(1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "snippy" }, -- snippets
					{ name = "nvim_lsp", max_item_count = 10 },
					{ name = "vimtex" },
					{ name = "path" }, -- file system paths
					{ name = "buffer" }, -- text within current buffer
				}),

				-- configure lspkind for vs-code like pictograms in completion menu
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},
}
