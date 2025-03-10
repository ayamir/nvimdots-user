local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions
local vim_path = require("core.global").vim_path

return {
	collections = {
		file = {
			initial_tab = 1,
			tabs = {
				{
					name = "Files",
					tele_func = function(opts)
						opts = opts or {}
						if vim.fn.getcwd() == vim_path then
							builtin.find_files(vim.tbl_deep_extend("force", opts, { no_ignore = true }))
						else
							builtin.find_files(opts)
						end
					end,
				},
				{
					name = "Frecency",
					tele_func = function()
						extensions.frecency.frecency()
					end,
				},
				{
					name = "Oldfiles",
					tele_func = function()
						builtin.oldfiles()
					end,
				},
				{
					name = "Buffers",
					tele_func = function()
						builtin.buffers()
					end,
				},
			},
		},
	},
}
