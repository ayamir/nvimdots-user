return function()
	require("project").setup({
		manual_mode = false,
		detection_methods = { "pattern" },
		patterns = { "=tcc_monorepo", "go.mod", ".git", "=nvim" },
		silent_chdir = true,
		exclude_dirs = {},
		show_hidden = false,
		scope_chdir = "global",
		history = {
			save_dir = vim.fn.stdpath("data"),
		},
	})
end
