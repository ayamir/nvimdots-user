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
	["n|<leader>td"] = map_callback(function()
			require("neotest").run.run({ strategy = "dap" })
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

	["n|mx"] = map_cu("BookmarksQuickMark")
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("bookmarks: quick mark"),
	["n|mX"] = map_cu("BookmarksMark")
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("bookmarks: mark with desc"),
	["n|mo"] = map_cu("BookmarksGoto"):with_noremap():with_nowait():with_silent():with_desc("bookmarks: search marks"),
	["n|mj"] = map_cu("BookmarksGotoNext")
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("bookmarks: goto next mark"),
	["n|mk"] = map_cu("BookmarksGotoPrev")
		:with_noremap()
		:with_nowait()
		:with_silent()
		:with_desc("bookmarks: goto prev mark"),
}
