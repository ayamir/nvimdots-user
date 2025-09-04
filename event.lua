local definitions = {
	-- Example
	bufs = {
		{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
	},
}

vim.api.nvim_create_user_command("CexprSystem", function(opts)
	local cmd = opts.args
	-- 如果命令里没有 /，就加上 ./ （表示当前目录）
	if not cmd:match("/") then
		cmd = "./" .. cmd
	end
	vim.cmd("cexpr system('" .. cmd .. "')")
	vim.cmd("copen")
end, {
	nargs = 1, -- 必须要有一个参数
	complete = "file", -- 文件路径补全
})

vim.api.nvim_create_user_command("CexprSystemTrouble", function(opts)
	local cmd = opts.args
	-- 如果命令里没有 /，默认加上 ./ 表示当前目录
	if not cmd:match("/") then
		cmd = "./" .. cmd
	end

	-- 执行命令
	local output = vim.fn.systemlist(cmd)

	-- 将输出转换成 trouble 能识别的 quickfix 项
	local qf_list = {}
	for _, line in ipairs(output) do
		-- 匹配 filename:linenumber:message 格式
		local file, lnum, msg = line:match("([^:]+):(%d+):(.+)")
		if file and lnum and msg then
			table.insert(qf_list, {
				filename = file,
				lnum = tonumber(lnum),
				col = 1, -- 可以根据需要改为具体列
				text = msg,
			})
		end
	end

	-- 设置 quickfix list
	vim.fn.setqflist({}, " ", { title = "CexprSystemTrouble", items = qf_list })

	-- 调用 trouble 显示 quickfix
	vim.cmd("Trouble quickfix")
end, {
	nargs = 1, -- 必须要有一个参数
	complete = "file", -- 路径补全
})

return definitions
