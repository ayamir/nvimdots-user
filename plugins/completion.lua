local completion = {}

completion["git@code.byted.org:chenjiaqi.cposture/codeverse.vim.git"] = {
	config = function()
		require("trae").setup()
	end,
}
completion["Wansmer/symbol-usage.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = function()
		require("symbol-usage").setup()
	end,
}

return completion
