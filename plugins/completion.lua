local completion = {}

completion["git@code.byted.org:chenjiaqi.cposture/codeverse.vim.git"] = {
	config = function()
		require("marscode").setup()
	end,
}
completion["rachartier/tiny-inline-diagnostic.nvim"] = {
	event = "VeryLazy",
	priority = 1000, -- needs to be loaded in first
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "powerline",
		})
	end,
}

return completion
