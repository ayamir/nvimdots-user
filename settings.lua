-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = false

settings["use_copilot"] = false

settings["colorscheme"] = "nvchad"

settings["nvchad"] = {
	theme = "rosepine-dawn",
	theme_toggle = { "rosepine-dawn", "rosepine" },
	nvdash = {
		load_on_startup = false,
	},
	ui = {
		statusline = {
			enabled = true,
			theme = "default",
			separator_style = "default",
		},
		tabufline = {
			enabled = true,
			lazyload = true,
		},
	},
	term = {
		base46_colors = true,
		winopts = { number = false, relativenumber = false },
		sizes = { sp = 0.3, vsp = 0.3, ["bo sp"] = 0.3, ["bo vsp"] = 0.3 },
		float = {
			relative = "editor",
			row = 0.1,
			col = 0.1,
			width = 0.8,
			height = 0.8,
			border = "single",
		},
	},
}

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
	"Bekaboo/dropbar.nvim",
}

settings["lsp_deps"] = function()
	return {
		"gopls",
		"lua_ls",
	}
end

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
