local bind = require("keymap.bind")
local map_cmd = bind.map_cmd

return {
	["nv|j"] = map_cmd("gj"):with_noremap(),
	["nv|k"] = map_cmd("gk"):with_noremap(),
}
