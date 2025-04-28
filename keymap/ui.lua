local map_cr = require("keymap.bind").map_cr

return {
	["n|<A-S-q>"] = map_cr("BufDelOthers"):with_noremap():with_silent():with_desc("buffer: Close other tabs"),
}
