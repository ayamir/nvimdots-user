local ui = {}

ui["kevinhwang91/nvim-hlslens"] = {
	event = "VeryLazy",
	config = function()
		require("hlslens").setup({
			calm_down = true,
			nearest_only = true,
			enable_incsearch = true,
		})
		local kopts = { noremap = true, silent = true }

		vim.api.nvim_set_keymap(
			"n",
			"n",
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts
		)
		vim.api.nvim_set_keymap(
			"n",
			"N",
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts
		)
		vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
	end,
}
ui["rachartier/tiny-glimmer.nvim"] = {
	event = "VeryLazy",
	priority = 10,
	opts = {
		enabled = true,
		disable_warnings = true,
		refresh_interval_ms = 8,
		overwrite = {
			auto_map = true,
			yank = {
				enabled = true,
				default_animation = "fade",
			},
			search = {
				enabled = true,
			},
			paste = {
				enabled = true,
			},
			undo = {
				enabled = true,
			},
			redo = {
				enabled = true,
			},
		},
	},
}

return ui
