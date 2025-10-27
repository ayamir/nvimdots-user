local completion = {}

completion["git@code.byted.org:chenjiaqi.cposture/codeverse.vim.git"] = {
	config = function()
		require("trae").setup()
	end,
}
completion["ayamir/garbage-day.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = function()
		require("garbage-day").setup({
			excluded_lsp_clients = { "null-ls" },
			notifications = true,
		})
	end,
}
completion["Wansmer/symbol-usage.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = function()
		require("symbol-usage").setup({})

		vim.api.nvim_create_user_command("E", function()
			require("symbol-usage").refresh()
		end, {})
	end,
}
completion["ayamir/lspsaga.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("user.configs.completion.lspsaga"),
	dependencies = "nvim-tree/nvim-web-devicons",
}

return completion
