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
ui["sphamba/smear-cursor.nvim"] = {
	opts = { -- Default  Range
		stiffness = 0.8, -- 0.6      [0, 1]
		trailing_stiffness = 0.6, -- 0.45     [0, 1]
		stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
		trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
		damping = 0.95, -- 0.85     [0, 1]
		damping_insert_mode = 0.95, -- 0.9      [0, 1]
		distance_stop_animating = 0.5, -- 0.1      > 0
	},
}

return ui
