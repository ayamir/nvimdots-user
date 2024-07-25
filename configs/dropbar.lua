return {
	bar = {
		hover = true,
		truncate = true,
		pick = { pivots = "etovxqpdygfblzhckisuran" },
	},
	sources = {
		path = {
			relative_to = function(_, win)
				local ok, cwd = pcall(vim.fn.getcwd, win)
				return ok and cwd or vim.fn.getcwd()
			end,
		},
		terminal = {
			name = function(buf)
				local name = vim.api.nvim_buf_get_name(buf)
				local term = select(2, require("toggleterm.terminal").identify(name))
				-- Trying to "snag" a display name from toggleterm
				if term then
					return term.display_name or term.name
				else
					return name
				end
			end,
		},
	},
}
