local function get_binary_path_list(binaries)
	local path_list = {}
	for _, binary in ipairs(binaries) do
		local path = vim.fn.exepath(binary)
		if path ~= "" then
			table.insert(path_list, path)
		end
	end
	return table.concat(path_list, ",")
end

return function(options)
	vim.lsp.config("clangd", {
		on_attach = options.on_attach,
		capabilities = vim.tbl_deep_extend("keep", { offsetEncoding = { "utf-16", "utf-8" } }, options.capabilities),
		cmd = {
			"clangd",
			"-j=12",
			"--enable-config",
			"--background-index",
			"--pch-storage=memory",
			-- You MUST set this arg ↓ to your c/cpp compiler location (if not included)!
			"--query-driver=" .. get_binary_path_list({ "clang++", "clang", "gcc", "g++", "g++-14" }),
			"--clang-tidy",
			"--all-scopes-completion",
			"--completion-style=detailed",
			"--header-insertion-decorators",
			"--header-insertion=iwyu",
			"--limit-references=3000",
			"--limit-results=350",
		},
		single_file = true,
	})
end
