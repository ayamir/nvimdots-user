return function()
	vim.g.rustaceanvim = {
		-- Disable automatic DAP configuration to avoid conflicts with previous user configs
		dap = {
			adapter = false,
			configuration = false,
			autoload_configurations = false,
		},
		tools = {
			executor = require("rustaceanvim.executors").toggleterm,
			reload_workspace_from_cargo_toml = true,
		},
		server = {
			standalone = true,
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = false, -- 不要一次性启用所有 features
						features = "default", -- 只启用 default
						buildScripts = { enable = false }, -- 关掉 build.rs 分析
					},
					checkOnSave = {
						command = "check", -- 保存时跑 clippy（可改成 "check" 或干脆关掉）
					},
					files = {
						excludeDirs = { "target", "node_modules" }, -- 排除无用目录
					},
				},
			},
		},
	}
end
