local editor = {}

editor["olimorris/persisted.nvim"] = {
	lazy = false,
}
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("configs.editor.better-escape"),
}
editor["chrisgrieser/nvim-spider"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
}
editor["kevinhwang91/nvim-ufo"] = {
	lazy = true,
	event = { "BufReadPost" },
	dependencies = {
		{ "luukvbaal/statuscol.nvim", branch = "0.10", config = require("configs.editor.statuscol") },
		{ "kevinhwang91/promise-async" },
	},
	config = require("configs.editor.ufo"),
	init = function()
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
}

return editor
