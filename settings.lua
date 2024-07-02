-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = false

settings["use_copilot"] = false

settings["colorscheme"] = "catppuccin"

settings["format_modifications_only"] = false

settings["format_disabled_dirs"] = {}

settings["transparent_background"] = false

settings["load_big_files_faster"] = true

settings["lsp_inlayhints"] = false

settings["server_formatting_block_list"] = {
	gopls = true,
}

settings["disabled_plugins"] = {
	"Jint-lzxy/lsp_signature.nvim",
}

return settings
