local editor = {}

editor["olimorris/persisted.nvim"] = {
	lazy = false,
}
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = true,
}
editor["chrisgrieser/nvim-spider"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
}
editor["kylechui/nvim-surround"] = {
	lazy = true,
	version = "*",
	event = { "CursorHoldI", "CursorHold" },
	config = function()
		require("nvim-surround").setup()
	end,
}
editor["heilgar/bookmarks.nvim"] = {
	lazy = true,
	cmd = {
		"BookmarkAdd",
		"BookmarkRemove",
		"Bookmarks",
	},
	dependencies = {
		"kkharji/sqlite.lua",
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("bookmarks").setup({
			-- your configuration comes here
			-- or leave empty to use defaults
			default_mappings = true,
			db_path = vim.fn.stdpath("data") .. "/bookmarks.db",
		})
		require("telescope").load_extension("bookmarks")
	end,
	keys = {
		{ "<leader>ba", "<cmd>BookmarkAdd<cr>", desc = "Add Bookmark" },
		{ "<leader>br", "<cmd>BookmarkRemove<cr>", desc = "Remove Bookmark" },
		{ "<leader>bj", desc = "Jump to Next Bookmark" },
		{ "<leader>bk", desc = "Jump to Previous Bookmark" },
		{ "<leader>bl", "<cmd>Bookmarks<cr>", desc = "List Bookmarks" },
	},
}
editor["jake-stewart/normal-cmdline.nvim"] = {
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

return editor
