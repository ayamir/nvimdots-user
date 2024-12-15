-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = false

settings["use_copilot"] = false

settings["colorscheme"] = "onenord"

settings["format_modifications_only"] = false

settings["format_disabled_dirs"] = {}

settings["transparent_background"] = false

settings["load_big_files_faster"] = true

settings["lsp_inlayhints"] = true

settings["server_formatting_block_list"] = {
	gopls = true,
}

settings["disabled_plugins"] = {
	"nvim-tree/nvim-tree.lua",
}

settings["lsp_deps"] = {
	"typos_lsp",
}

settings["gui_config"] = {
	font_name = "JetBrainsMono Nerd Font",
	font_size = 13,
}

settings["neovide_config"] = {
	no_idle = true,
	refresh_rate = 120,
	cursor_vfx_mode = "railgun",
	cursor_vfx_opacity = 200.0,
	cursor_antialiasing = true,
	cursor_trail_length = 0.05,
	cursor_animation_length = 0.03,
	cursor_vfx_particle_speed = 20.0,
	cursor_vfx_particle_density = 5.0,
	cursor_vfx_particle_lifetime = 1.2,
}

return settings
