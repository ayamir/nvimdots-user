local bind = require("keymap.bind")
local map_cmd = bind.map_cmd

return {
	["nv|j"] = map_cmd("gj"),
	["nv|k"] = map_cmd("gk"),
}
