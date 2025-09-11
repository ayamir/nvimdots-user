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
		["n|gT"] = map_cr("Lspsaga goto_type_definition")
			:with_noremap()
			:with_nowait()
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Goto type definition"),

		["n|gy"] = map_callback(function()
				require("symbol-usage").refresh()
			end)
			:with_noremap()
			:with_nowait()
			:with_silent()
			:with_desc("lsp: refresh symbol usage"),
	}
end

return mappings
