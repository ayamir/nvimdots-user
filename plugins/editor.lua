local editor = {}

editor["olimorris/persisted.nvim"] = {
	lazy = false,
}
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = true,
}
editor["chrisgrieser/nvim-spider"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
}
editor["kylechui/nvim-surround"] = {
	lazy = true,
	version = "*",
	event = { "CursorHoldI", "CursorHold" },
	config = function()
		require("nvim-surround").setup()
	end,
}

return editor
