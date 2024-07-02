local completion = {}

completion["smjonas/inc-rename.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = function()
		require("inc_rename").setup()
	end,
}

return completion
