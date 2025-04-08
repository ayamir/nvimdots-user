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
editor["jake-stewart/auto-cmdheight.nvim"] = {
	lazy = false,
	opts = {
		max_lines = 5,
		duration = 2,
		remove_on_key = true,
		clear_always = false,
	},
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

return editor
