local tool = {}

tool["dstein64/vim-startuptime"] = {
	lazy = true,
	cmd = "StartupTime",
}
tool["fei6409/log-highlight.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = true,
}

return tool
