local ui = {}

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
