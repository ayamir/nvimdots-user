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
completion["rachartier/tiny-inline-diagnostic.nvim"] = {
	event = "VeryLazy",
	priority = 1000, -- needs to be loaded in first
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern",
			options = {
				show_source = {
					enabled = true,
					if_many = true,
				},
				use_icons_from_diagnostic = true,
				break_line = {
					enabled = true,
				},
			},
		})
		vim.diagnostic.config({
			underline = false,
			virtual_text = false,
		})
	end,
}

return completion
