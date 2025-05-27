local completion = {}
local global = require("core.global")

completion["git@code.byted.org:chenjiaqi.cposture/codeverse.vim.git"] = {
	config = function()
		require("trae").setup()
	end,
}
completion["ayamir/garbage-day.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = function()
		require("modules.utils").load_plugin("garbage-day", {
			excluded_lsp_clients = { "null-ls" },
			notifications = true,
		})
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
