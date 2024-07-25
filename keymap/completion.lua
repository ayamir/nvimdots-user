local mappings = {}
local map_cr = require("keymap.bind").map_cr
local map_callback = require("keymap.bind").map_callback

-- Place global keymaps here.
mappings["plug_map"] = {}

-- NOTE: This function is special! Keymaps defined here are ONLY effective in buffers with LSP(s) attached
-- NOTE: Make sure to include `:with_buffer(buf)` to limit the scope of your mappings.
---@param buf number @The effective bufnr
mappings["lsp"] = function(buf)
	return {
		["n|go"] = map_cr("Lspsaga outline"):with_silent():with_buffer(buf):with_desc("lsp: Toggle outline"),
	}
end

return mappings
