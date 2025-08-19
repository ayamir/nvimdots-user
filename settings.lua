-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}
local global = require("core.global")

-- Examples
settings["use_ssh"] = false

if global.is_mac then
	settings["use_copilot"] = false
else
	settings["use_copilot"] = true
end

settings["colorscheme"] = "catppuccin"

settings["format_modifications_only"] = false

settings["format_disabled_dirs"] = {}

settings["background"] = "dark"

settings["transparent_background"] = false

settings["load_big_files_faster"] = true

settings["lsp_inlayhints"] = true

settings["server_formatting_block_list"] = {
	gopls = true,
}

settings["disabled_plugins"] = {
	"folke/flash.nvim",
	"romainl/vim-cool",
}

settings["gui_config"] = {
	font_name = "JetBrainsMono Nerd Font",
	font_size = 13,
}

settings["treesitter_deps"] = function()
	return {
		"bash",
		"c",
		"cpp",
		"css",
		"go",
		"gomod",
		"html",
		"javascript",
		"json",
		"jsonc",
		-- "latex",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"typescript",
		"vimdoc",
		"vue",
		"yaml",
	}
end

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

settings["search_backend"] = "fzf"

settings["chat_lang"] = "Chinese"

return settings
