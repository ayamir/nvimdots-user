return function()
	require("project").setup({
		manual_mode = false,
		detection_methods = { "pattern" },
		patterns = { "=tcc_monorepo", "go.mod", ".git" },
		silent_chdir = false,
		ignore_lsp = { "null-ls", "copilot" },
		exclude_dirs = {},
		show_hidden = false,
		scope_chdir = "global",
		datapath = vim.fn.stdpath("data"),
	})
end
