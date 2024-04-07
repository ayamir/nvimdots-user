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
	dependencies = {
		"theHamsta/nvim_rocks",
		build = "pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
		config = function()
			require("nvim_rocks").ensure_installed("luautf8")
		end,
	},
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
editor["keaising/im-select.nvim"] = {
	config = function()
		require("im_select").setup({})
	end,
}

return editor
