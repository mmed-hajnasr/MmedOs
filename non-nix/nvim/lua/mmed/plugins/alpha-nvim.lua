return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"      █████   ██    ██                                ██   ",
			"   ██████  █████ █████                                 ██  ",
			"  ██   █  █  █████ █████                               ██  ",
			" █    █  █   █ ██  █ ██                                ██  ",
			"     █  █    █     █                                   ██  ",
			"    ██ ██    █     █    ███ ████ ████      ███     ███ ██  ",
			"    ██ ██    █     █     ███ ████ ███  █  █ ███   █████████",
			"    ██ ██    █     █      ██  ████ ████  █   ███ ██   ████ ",
			"    ██ ██    █     █      ██   ██   ██  ██    █████    ██  ",
			"    ██ ██    █     ██     ██   ██   ██  ████████ ██    ██  ",
			"    █  ██    █     ██     ██   ██   ██  ███████  ██    ██  ",
			"       █     █      ██    ██   ██   ██  ██       ██    ██  ",
			"   ████      █      ██    ██   ██   ██  ████    ███    ██  ",
			"  █  █████           ██   ███  ███  ███  ███████  █████    ",
			" █     ██                  ███  ███  ███  █████    ███     ",
			" █                                                         ",
			"  █                                                        ",
			"   ██                                                      ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("SPC h", "  > Toggle file explorer", "<cmd>Yazi<CR>"),
			dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fw", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		vim.defer_fn(function()
			vim.cmd("Lazy reload base16-nvim")
		end, 50) -- 100ms delay
	end,
}
