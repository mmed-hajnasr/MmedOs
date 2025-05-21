return {
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "pest-parser/pest.vim" },
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup_handlers({

				["pest_ls"] = function()
					require("pest-vim").setup({})
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "barreiroleo/ltex_extra.nvim" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- latex support
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})

			-- grammer and typos
			lspconfig.ltex.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- rest of your on_attach process.
					require("ltex_extra").setup()
				end,
			})

			-- typescript
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.svelte.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- html and css
			lspconfig.biome.setup({
				capabilities = capabilities,
			})

			-- cpp
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- pest the rust parser library
			lspconfig.pest_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.nil_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", require("pretty_hover").hover, {})
			-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, {})
			vim.keymap.set("n", "<leader>[", function()
				vim.diagnostic.goto_next()
			end, {})
			vim.keymap.set("n", "<leader>]", function()
				vim.diagnostic.goto_prev()
			end, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {}) -- smart rename
			vim.diagnostic.config({
				float = {
					focusable = false,
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
