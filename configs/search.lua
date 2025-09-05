return function()
	local vim_path = require("core.global").vim_path
	local search_backend = require("core.settings").search_backend
	local use_fzf = search_backend == "fzf"
	local fzf = use_fzf and require("fzf-lua")
	local extensions = require("telescope").extensions
	local builtins = require("telescope.builtin")
	local prompt_pos = require("telescope.config").values.layout_config.horizontal.prompt_position

	local base_opts = use_fzf
			and { fzf_opts = { ["--layout"] = (prompt_pos == "top" and "reverse" or "default") }, profile = "telescope" }
		or {}

	---Returns current directory and whether it's a Git repo root
	---@return string @Current working directory
	---@return boolean|nil @true if `.git` folder exists here, false if `.git` exists but isn't folder, nil if `.git` missing
	local function get_root_info()
		local cwd = vim.uv.cwd()
		local stat = vim.uv.fs_stat(".git")
		return cwd, stat and stat.type == "directory"
	end

	---Creates a file search function based on backend and context
	---@param fzf_fn string @Name of the fzf-lua function to call (e.g. "files")
	---@param tb_fn function @Telescope builtin function to call (e.g. `builtin.find_files`)
	---@param git_only boolean @Whether to restrict search to git tracked files only
	---@return fun():any @A function that executes the selected search with proper options
	local function file_searcher(fzf_fn, tb_fn, git_only)
		return function()
			local cwd, is_git = get_root_info()
			local opts = vim.deepcopy(base_opts, true)
			if cwd == vim_path then
				opts.no_ignore = true
				return (use_fzf and fzf[fzf_fn] or tb_fn)(opts)
			elseif git_only and is_git then
				return (use_fzf and fzf.git_files or builtins.git_files)(opts)
			elseif not git_only then
				return (use_fzf and fzf[fzf_fn] or tb_fn)(opts)
			else
				-- fallback
				return (use_fzf and fzf.files or builtins.find_files)(opts)
			end
		end
	end

	---Creates a function that performs a live grep search using the appropriate backend
	---@param fzf_fn string @Name of the fzf-lua grep function to call (e.g. "live_grep")
	---@param tb_fn function @Telescope builtin grep function (e.g. `builtin.grep_string`)
	---@return fun():any @Function that runs the selected grep with proper options
	local function grep_searcher(fzf_fn, tb_fn)
		return function()
			local cwd = vim.uv.cwd()
			local opts = vim.deepcopy(base_opts, true)
			if cwd == vim_path then
				if use_fzf then
					opts.no_ignore = true
				else
					opts = { additional_args = { "--no-ignore" } }
				end
			end
			return (use_fzf and fzf[fzf_fn] or tb_fn)(opts)
		end
	end

	local file = {
		{ "Oldfiles", use_fzf and function()
			fzf.oldfiles(base_opts)
		end or builtins.oldfiles },
		{ "Buffers", builtins.buffers },
	}
	if vim.uv.cwd() == vim_path then
		table.insert(file, 1, { "Files", file_searcher("files", builtins.find_files, true) })
		table.insert(file, 2, { "Frecency", extensions.frecency.frecency })
	else
		table.insert(file, 1, { "Files", require("fff").find_files })
	end

	-- Tables of pickers
	local pickers = {
		file = file,
		pattern = {
			{ "Word in project", grep_searcher("live_grep", extensions.live_grep_args.live_grep_args) },
			{ "Word under cursor", grep_searcher("grep_cword", builtins.grep_string) },
		},
		git = {
			{ "Branches", builtins.git_branches },
			{ "Commits", builtins.git_commits },
			{ "Commit content", extensions.advanced_git_search.search_log_content },
			{ "Diff current file", extensions.advanced_git_search.diff_commit_file },
		},
		dossier = {
			{ "Sessions", extensions.persisted.persisted },
			{
				"Projects",
				function()
					extensions.projects.projects()
				end,
			},
			{ "Zoxide", extensions.zoxide.list },
		},
		misc = {
			{ "Notify", extensions.notify.notify },
			{ "Undo History", extensions.undo.undo },
		},
	}

	-- Build collections
	local collections = {}
	for kind, list in pairs(pickers) do
		local init = { initial_tab = 1, tabs = {} }
		for _, entry in ipairs(list) do
			table.insert(init.tabs, { name = entry[1], tele_func = entry[2] })
		end
		collections[kind] = init
	end

	require("search").setup({
		prompt_position = prompt_pos,
		collections = collections,
	})

	vim.api.nvim_create_user_command("TelescopeFiles", function()
		require("search").open({ collection = "file" })
	end, { nargs = 0 })

	vim.api.nvim_create_user_command("TelescopePatterns", function()
		require("search").open({ collection = "pattern" })
	end, { nargs = 0 })

	vim.api.nvim_create_user_command("TelescopeGit", function()
		require("search").open({ collection = "git" })
	end, { nargs = 0 })

	vim.api.nvim_create_user_command("TelescopeDossier", function()
		require("search").open({ collection = "dossier" })
	end, { nargs = 0 })

	vim.api.nvim_create_user_command("TelescopeMisc", function()
		require("search").open({ collection = "misc" })
	end, { nargs = 0 })
end
