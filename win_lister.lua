-- ~/.config/nvim/lua/win_lister.lua
local M = {}

local function win_info(all_tabs)
	local tabs = all_tabs and vim.api.nvim_list_tabpages() or { vim.api.nvim_get_current_tabpage() }
	local lines = {}
	for _, tp in ipairs(tabs) do
		table.insert(lines, ("Tabpage %d"):format(tp))
		for _, w in ipairs(vim.api.nvim_tabpage_list_wins(tp)) do
			local buf = vim.api.nvim_win_get_buf(w)
			local name = vim.api.nvim_buf_get_name(buf)
			-- 用 -(empty)- 占位
			name = name == "" and "-(empty)-" or name
			table.insert(lines, ("  win %-3d buf %-3d  %s"):format(w, buf, name))
		end
	end
	return table.concat(lines, "\n")
end

vim.api.nvim_create_user_command("ListWins", function(opts)
	local arg = (opts.args or ""):match("^%s*(%S-)%s*$")
	print(win_info(arg == "all"))
end, {
	nargs = "?",
	complete = function()
		return { "current", "all" }
	end,
})

local function complete_win_ids()
	local list = {}
	for _, w in ipairs(vim.api.nvim_list_wins()) do
		table.insert(list, tostring(w))
	end
	return list
end

vim.api.nvim_create_user_command("CloseWin", function(opts)
	local wid = tonumber(opts.args)
	if not wid then
		vim.notify("用法: :CloseWin <winid>", vim.log.levels.WARN)
		return
	end

	if not vim.api.nvim_win_is_valid(wid) then
		vim.notify(("window %d 不存在或已关闭"):format(wid), vim.log.levels.ERROR)
		return
	end

	vim.api.nvim_win_close(wid, false)
	vim.notify(("已关闭窗口 %d"):format(wid), vim.log.levels.INFO)
end, {
	nargs = 1,
	complete = complete_win_ids,
})

local function cleanup_fzf_windows()
	-- 获取当前的 fzf 窗口对象
	local winobj = require("fzf-lua.utils").fzf_winobj()
	if winobj then
		winobj:close()
	end

	-- 清理上下文
	require("fzf-lua.utils").clear_CTX()

	-- 强制清理所有可能的 fzf 相关窗口
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local bufname = vim.api.nvim_buf_get_name(buf)
		if bufname:match("fzf") or vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
			pcall(vim.api.nvim_win_close, win, true)
		end
	end
end

-- 绑定到快捷键
vim.keymap.set("n", "<leader>fc", cleanup_fzf_windows, { desc = "Cleanup fzf windows" })

return M
