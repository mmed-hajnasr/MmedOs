return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
  -- stylua: ignore
    keys = {
      { "S", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
		config = function()
			require("flash").setup()
			require("flash").toggle()
		end,
	},
}
