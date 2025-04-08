return {
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")
		api.config.mappings.default_on_attach(bufnr)
		vim.keymap.del("n", "<C-e>", { buffer = bufnr })
		vim.keymap.set("n", "<C-s>", function()
			api.node.open.horizontal()
		end)
	end,
}
