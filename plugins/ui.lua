local ui = {}

ui["nvim-zh/colorful-winsep.nvim"] = {
	lazy = true,
	event = "WinLeave",
	config = function()
		require("colorful-winsep").setup({
			hi = {
				bg = "#2b3339",
				fg = "#83c092",
			},
			no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
			symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
			only_line_seq = true,
			smooth = true,
			exponential_smoothing = true,
			anchor = {
				left = { height = 1, x = -1, y = -1 },
				right = { height = 1, x = -1, y = 0 },
				up = { width = 0, x = -1, y = 0 },
				bottom = { width = 0, x = 1, y = 0 },
			},
		})
	end,
}

return ui
