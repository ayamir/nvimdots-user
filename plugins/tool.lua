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
		"leoluz/nvim-dap-go",
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
tool["dmtrKovalenko/fff.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	build = "cargo build --release",
	opts = {
		-- pass here all the options
	},
	keys = {
		{
			"<leader>fe", -- try it if you didn't it is a banger keybinding for a picker
			function()
				require("fff").find_files() -- or find_in_git_root() if you only want git files
			end,
			desc = "Open file picker",
		},
	},
}

return tool
