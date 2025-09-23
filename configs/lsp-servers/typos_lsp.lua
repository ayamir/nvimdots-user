return function()
	vim.lsp.config("typos_lsp", {
		filetypes = { "*" },
		root_dir = function()
			return vim.loop.cwd()
		end,
		cmd = { "typos-lsp" }, -- 需要确保 typos-lsp 命令在 PATH 中
		init_options = {
			diagnosticSeverity = "Warning",
		},
		single_file = true,
	})
end
