return function()
	require("neotest").setup({
		status = {
			enabled = true,
			signs = true,
			virtual_text = true, -- 显示虚拟文本状态
		},
		output = {
			enabled = true,
			open_on_run = "short", -- 运行时自动打开输出
		},
		output_panel = {
			enabled = true,
			open = "botright split | resize 15",
		},
		quickfix = {
			enabled = false,
			open = false,
		},

		adapters = {
			require("neotest-golang")({ -- Specify configuration
				go_test_args = {
					"-v",
					"-race",
					"-count=1",
					"-failfast",
					"-gcflags=all=-N",
					"-gcflags=all=-l",
				},
			}),
			require("neotest-rust")({
				args = {
					"--success-output final",
					"--failure-output final",
				},
				dap_adapter = "codelldb",
			}),
		},
	})
end
