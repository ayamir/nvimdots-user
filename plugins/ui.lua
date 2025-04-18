local ui = {}

ui["Wansmer/symbol-usage.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = function()
		require("symbol-usage").setup()
	end,
}

return ui
