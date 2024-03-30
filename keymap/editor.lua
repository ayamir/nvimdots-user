local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

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
}
