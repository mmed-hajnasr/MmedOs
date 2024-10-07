return {
	"okuuva/auto-save.nvim",
	cmd = "ASToggle", -- optional for lazy loading on command
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		enabled = true,
		execution_message = {
			message = "",
		},
		callbacks = { -- functions to be executed at different intervals
			before_saving = function()
				vim.cmd("w!")
			end,
			after_saving = function()
				vim.cmd("w!")
			end,
		},
	},
}
