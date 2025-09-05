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
tool["ayamir/bookmarks.nvim"] = {
	dependencies = {
		{ "kkharji/sqlite.lua" },
		{ "nvim-telescope/telescope.nvim" }, -- currently has only telescopes supported, but PRs for other pickers are welcome
		{ "stevearc/dressing.nvim" }, -- optional: better UI
	},
	opts = {},
}
tool["jake-stewart/normal-cmdline.nvim"] = {
	event = "CmdlineEnter",
	config = function()
		-- make the cmdline insert mode a beam
		vim.opt.guicursor:append("ci:ver1,c:ver1")

		local cmd = require("normal-cmdline")
		cmd.setup({
			-- key to hit within cmdline to enter normal mode:
			key = "<esc>",
			-- the cmdline text highlight when in normal mode:
			hl = "Normal",
			-- these mappings only apply to normal mode in cmdline:
			mappings = {
				["k"] = cmd.history.prev,
				["j"] = cmd.history.next,
				["<cr>"] = cmd.accept,
				["<esc>"] = cmd.cancel,
				["<c-c>"] = cmd.cancel,
				[":"] = cmd.reset,
			},
		})
	end,
}

return tool
