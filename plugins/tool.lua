local tool = {}

tool["dstein64/vim-startuptime"] = {
	lazy = true,
	cmd = "StartupTime",
}
tool["fei6409/log-highlight.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = true,
}
tool["nvim-neotest/neotest"] = {
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"fredrikaverpil/neotest-golang",
	},
	opts = {
		discovery = {
			-- Drastically improve performance in ginormous projects by
			-- only AST-parsing the currently opened buffer.
			enabled = true,
			-- Number of workers to parse files concurrently.
			-- A value of 0 automatically assigns number based on CPU.
			-- Set to 1 if experiencing lag.
			concurrent = 0,
		},
		running = {
			-- Run tests concurrently when an adapter provides multiple commands to run.
			concurrent = true,
		},
		quickfix = {
			open = function()
				vim.cmd("Trouble quickfix")
			end,
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-golang"), -- Registration
			},
		})
	end,
}

return tool
