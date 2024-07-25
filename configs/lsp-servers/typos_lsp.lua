return function()
	require("lspconfig").typos_lsp.setup({
		filetypes = { "*" },
		single_file_support = true,
		root_dir = function()
			return vim.loop.cwd()
		end,
		init_options = {
			diagnosticSeverity = "Warning",
		},
	})
end
