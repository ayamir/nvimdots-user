local ui = {}

ui["nvim-neo-tree/neo-tree.nvim"] = {
	lazy = true,
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal", "quickfix" },
						},
					},
				})
			end,
		},
	},
	config = require("user.configs.ui.neotree"),
}
ui["gbprod/nord.nvim"] = {
	lazy = false,
	priority = 1000,
	config = function()
		require("nord").setup({})
	end,
}
ui["neanias/everforest-nvim"] = {
	lazy = true,
	config = function()
		require("everforest").setup({
			italics = true,
			on_highlights = function(hl, palette)
				-- The default highlights for TSBoolean is linked to `Purple` which is fg
				-- purple and bg none. If we want to just add a bold style to the existing,
				-- we need to have the existing *and* the bold style. (We could link to
				-- `PurpleBold` here otherwise.)
				hl.Constant = { fg = palette.aqua, bg = palette.none, bold = true }
				hl.Function = { fg = palette.green, bg = palette.none, italic = true }
				hl.Keyword = { fg = palette.red, bg = palette.none, italic = true }
			end,
		})
	end,
}
ui["ayamir/vscode.nvim"] = {
	lazy = true,
	config = function()
		require("vscode").setup({
			italic_comments = true,
			underline_links = true,
		})
	end,
}

return ui
