return {
	"RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
	config = function()
		require("base16-colorscheme").setup({
			base00 = "#0c1014",
			base01 = "#11151c",
			base02 = "#091f2e",
            base03 = "#0a3749",
            base04 = "#245361",
            base05 = "#599cab",
            base06 = "#99d1ce",
            base07 = "#d3ebe9",
            base08 = "#c23127",
            base09 = "#0059b3",
            base0A = "#edb443",
            base0B = "#2aa889",
            base0C = "#33859e",
            base0D = "#195466",
            base0E = "#888ca6",
            base0F = "#e7bd42",
		})
	end,
}