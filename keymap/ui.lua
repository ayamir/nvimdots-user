local map_cr = require("keymap.bind").map_cr
local map_callback = require("keymap.bind").map_callback

return {
	["n|<A-S-q>"] = map_cr("BufferLineCloseOthers"):with_noremap():with_silent():with_desc("buffer: Close other tabs"),
}
