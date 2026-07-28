local bind = require("keymap.bind")
local map_cmd = bind.map_cmd

return {
	-- Plugin: nvim-spider
	["nxo|w"] = map_cmd("<cmd>lua require('spider').motion('w')<CR>")
		:with_silent()
		:with_noremap()
		:with_desc("Spider-w"),
	["nxo|e"] = map_cmd("<cmd>lua require('spider').motion('e')<CR>")
		:with_silent()
		:with_noremap()
		:with_desc("Spider-e"),
	["nxo|b"] = map_cmd("<cmd>lua require('spider').motion('b')<CR>")
		:with_silent()
		:with_noremap()
		:with_desc("Spider-b"),
	["n|<A-a>"] = map_cmd("<C-x>"):with_silent():with_noremap():with_desc("minus number"),
}
