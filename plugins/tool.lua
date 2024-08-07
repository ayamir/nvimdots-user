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
		local gotest_cfg = { -- Specify configuration
			go_test_args = {
				"-v",
				"-race",
				"-count=1",
				"-timeout=60s",
				"-gcflags=all=-l",
			},
		}
		require("neotest").setup({
			adapters = {
				require("neotest-golang")(gotest_cfg),
			},
		})
	end,
}
local leet_arg = "lc"
tool["kawre/leetcode.nvim"] = {
	lazy = leet_arg ~= vim.fn.argv()[1],
	opts = {
		arg = leet_arg,
		lang = "cpp",
		cn = { -- leetcode.cn
			enabled = true, ---@type boolean
			translator = false, ---@type boolean
			translate_problems = true, ---@type boolean
		}, -- configuration goes here
		description = {
			position = "left",
			width = "20%",
			show_stats = true,
		},
		injector = {
			["cpp"] = {
				before = { "#include <vector>", "#include <iostream>", "using namespace std;" },
				after = "int main() { Solution s; return 0; }",
			},
		},
	},
}

return tool
