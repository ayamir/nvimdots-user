local ui = {}

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
