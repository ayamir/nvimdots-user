return {
	keys = {
		["<S-Tab>"] = function(win)
			win:toggle()
		end,
		["<A-i>"] = function(win)
			win:next({ focus = true })
		end,
		["<A-o>"] = function(win)
			win:prev({ focus = true })
		end,
	},
	bottom = {
		{ ft = "qf", size = { height = 0.3 } },
		{ ft = "neotest-output-panel", size = { height = 0.3 } },
		{
			ft = "toggleterm",
			size = { height = 0.3 },
			filter = function(_, win)
				return vim.w[win].relative == ""
			end,
		},
		{
			ft = "help",
			size = { height = 0.3 },
			filter = function(buf)
				return vim.bo[buf].buftype == "help"
			end,
		},
	},
}
