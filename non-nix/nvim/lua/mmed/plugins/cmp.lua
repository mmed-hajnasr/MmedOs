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
			"kristijanhusak/vim-dadbod-completion",
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
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("snippy").expand_snippet(args.body) -- For `snippy` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-y>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = cmp.config.sources({
					{ name = "snippy" }, -- snippets
					{ name = "nvim_lsp" },
					{ name = "vimtex" },
					{ name = "vim-dadbod-completion" },
					{ name = "crates" },
					{ name = "path" }, -- file system paths
					{ name = "buffer" }, -- text within current buffer
				}),
			})
		end,
	},
}
