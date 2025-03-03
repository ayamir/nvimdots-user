local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_callback = bind.map_callback

return {
	["n|<Esc>p"] = map_callback(function()
			require("search").open({ collection = "file" })
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Find files"),
	["n|<leader>tc"] = map_callback(function()
			require("neotest").run.run()
		end)
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("test: test current case"),
	["n|<leader>tf"] = map_callback(function()
			require("neotest").run.run(vim.fn.expand("%"))
		end)
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("test: test current file"),
	["n|<leader>tp"] = map_callback(function()
			local filename = vim.api.nvim_buf_get_name(0)
			require("neotest").run.run(vim.fn.fnamemodify(filename, ":p:h:h"))
		end)
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("test: test current package"),
	["n|<leader>tw"] = map_callback(function()
			require("neotest").run.run(vim.fn.getcwd())
		end)
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("test: test current workspace"),
	["n|<leader>ts"] = map_cu("Neotest summary")
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("test: toggle test summary"),
	["n|<leader>tl"] = map_callback(function()
			require("neotest").run.run_last()
		end)
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("test: test last run"),
	["n|<leader>to"] = map_cu("Neotest output-panel")
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("test: toggle test output panel"),

	["n|<leader>Lr"] = map_cu("Leet run"):with_noremap():with_nowait():with_silent():with_desc("leetcode: run"),
	["n|<leader>Ls"] = map_cu("Leet submit"):with_noremap():with_nowait():with_silent():with_desc("leetcode: submit"),
	["n|<leader>Ll"] = map_cu("Leet list"):with_noremap():with_nowait():with_silent():with_desc("leetcode: list"),
	["n|<leader>Ld"] = map_cu("Leet desc"):with_noremap():with_nowait():with_silent():with_desc("leetcode: desc"),
	["n|<leader>Lm"] = map_cu("Leet menu"):with_noremap():with_nowait():with_silent():with_desc("leetcode: menu"),
}
