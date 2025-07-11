return {
	bar = {
		hover = true,
		truncate = true,
		pick = { pivots = "etovxqpdygfblzhckisuran" },
	},
	sources = {
		path = {
			relative_to = function()
				-- Only show the leaf filename in dropbar
				return vim.fn.expand("%:p:h")
			end,
		},
	},
}
