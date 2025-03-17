local completion = {}

completion["git@code.byted.org:chenjiaqi.cposture/codeverse.vim.git"] = {
	config = function()
		require("marscode").setup()
	end,
}

return completion
