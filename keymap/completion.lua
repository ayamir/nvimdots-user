local mappings = {}
local map_callback = require("keymap.bind").map_callback

-- Place global keymaps here.
mappings["plug_map"] = {}

-- NOTE: This function is special! Keymaps defined here are ONLY effective in buffers with LSP(s) attached
-- NOTE: Make sure to include `:with_buffer(buf)` to limit the scope of your mappings.
---@param buf number @The effective bufnr
mappings["lsp"] = function(buf)
	return {
		-- Example
		["n|K"] = map_callback(function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					-- vim.lsp.buf.hover()
					vim.cmd([[Lspsaga hover_doc]])
				end
			end)
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Show doc"),
	}
end

return mappings
