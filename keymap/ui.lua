local map_cr = require("keymap.bind").map_cr
local map_callback = require("keymap.bind").map_callback

return {
	["n|<C-n>"] = map_cr("Neotree"):with_noremap():with_silent():with_desc("filetree: Toggle"),
}
