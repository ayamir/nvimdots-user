local tool = {}

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
		"rouge8/neotest-rust",
	},
	config = require("user.configs.tool.neotest"),
}
tool["lowitea/aw-watcher.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	opts = {
		aw_server = {
			host = "127.0.0.1",
			port = 5600,
		},
	},
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
tool["danielfalk/smart-open.nvim"] = {
	branch = "0.2.x",
	config = function()
		require("telescope").load_extension("smart_open")
	end,
	dependencies = {
		"kkharji/sqlite.lua",
	},
}

return tool
