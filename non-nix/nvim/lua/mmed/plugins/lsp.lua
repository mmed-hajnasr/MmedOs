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
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {},
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local util = require("lspconfig.util")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.grammarly.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				root_dir = util.root_pattern("Cargo.toml"),
			})

			lspconfig.nil_ls.setup({
				capabilities = capabilities
			})

			vim.keymap.set("n", "K", require("pretty_hover").hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<leader>gD", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, {})
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, {})
			vim.keymap.set("n", "]d", function()
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
