local ui = {}

-- ui["kevinhwang91/nvim-hlslens"] = {
-- 	event = "VeryLazy",
-- 	config = function()
-- 		require("hlslens").setup({
-- 			calm_down = true,
-- 			nearest_only = true,
-- 			enable_incsearch = true,
-- 		})
-- 		local kopts = { noremap = true, silent = true }

-- 		vim.api.nvim_set_keymap(
-- 			"n",
-- 			"n",
-- 			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
-- 			kopts
-- 		)
-- 		vim.api.nvim_set_keymap(
-- 			"n",
-- 			"N",
-- 			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
-- 			kopts
-- 		)
-- 		vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
-- 		vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
-- 		vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
-- 		vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
-- 	end,
-- }
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
ui["folke/noice.nvim"] = {
	event = "VeryLazy",
	opts = {
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		cmdline = {
			enabled = true, -- enables the Noice cmdline UI
			view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}

return ui
