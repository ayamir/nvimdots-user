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
	left = {
		{
			ft = "neo-tree",
			pinned = true,
			collapsed = false,
			size = { height = 0.6, width = 40 },
			open = "Neotree position=left filesystem",
			filter = function(buf)
				return vim.b[buf].neo_tree_source == "filesystem"
			end,
		},
		{
			ft = "neo-tree",
			pinned = true,
			collapsed = true,
			size = { height = 0.4, width = 40 },
			open = "Neotree position=top git_status",
			filter = function(buf)
				return vim.b[buf].neo_tree_source == "git_status"
			end,
		},
	},
	bottom = {
		{ ft = "qf", size = { height = 0.3 } },
		{ ft = "neotest-output-panel", size = { height = 0.4 } },
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
