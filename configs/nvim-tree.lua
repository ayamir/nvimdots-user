return {
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")
		api.config.mappings.default_on_attach(bufnr)
		vim.keymap.del("n", "<C-e>", { buffer = bufnr })
	end,
	sync_root_with_cwd = false,
}
