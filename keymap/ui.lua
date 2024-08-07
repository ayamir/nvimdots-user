local map_cr = require("keymap.bind").map_cr
local map_callback = require("keymap.bind").map_callback

return {
	["n|<C-n>"] = map_cr("Neotree toggle"):with_noremap():with_silent():with_desc("filetree: Toggle"),
	["n|<A-S-q>"] = map_cr("BufferLineCloseOthers"):with_noremap():with_silent():with_desc("buffer: close others"),
}
