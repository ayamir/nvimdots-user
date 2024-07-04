local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_callback = bind.map_callback

return {
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
	["n|<leader>to"] = map_cu("Neotest output")
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("test: toggle test output panel"),
}
