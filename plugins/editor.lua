local editor = {}

-- editor["olimorris/persisted.nvim"] = {
-- 	lazy = false,
-- }
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("configs.editor.better-escape"),
}
editor["chrisgrieser/nvim-spider"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
}

return editor
