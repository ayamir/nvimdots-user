local mappings = {}
local map_cr = require("keymap.bind").map_cr
local map_callback = require("keymap.bind").map_callback
local use_fzf = require("core.settings").search_backend == "fzf"
local prompt_position = require("telescope.config").values.layout_config.horizontal.prompt_position
local fzf_opts = { ["--layout"] = prompt_position == "top" and "reverse" or "default" }

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
		["n|gh"] = map_callback(function()
			if use_fzf then
				require("fzf-lua").lsp_finder({
					fzf_opts = fzf_opts,
				})
			else
				require("telescope.builtin").lsp_references()
			end
		end),
		["n|gm"] = map_callback(function()
			if use_fzf then
				require("fzf-lua").lsp_implementations({
					fzf_opts = fzf_opts,
				})
			else
				require("telescope.builtin").lsp_implementations()
			end
		end),
	}
end

return mappings
