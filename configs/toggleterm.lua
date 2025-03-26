return {
	float_opts = {
		border = "double",
		width = function()
			return math.ceil(vim.o.columns * 0.80)
		end,
		height = function()
			return math.ceil(vim.o.lines * 0.80)
		end,
		winblend = 0,
	},
}
