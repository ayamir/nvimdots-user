local bind = require("keymap.bind")
local map_cmd = bind.map_cmd

return {
	["n|j"] = map_cmd("gj"),
	["n|k"] = map_cmd("gk"),
}
