return function()
	local wilder = require("wilder")
	local icons = { ui = require("modules.utils.icons").get("ui") }

	wilder.set_option("use_python_remote_plugin", 0)
	wilder.set_option("pipeline", {
		wilder.branch(
			wilder.cmdline_pipeline({
				use_python = 0,
				fuzzy = 1,
				fuzzy_filter = wilder.lua_fzy_filter(),
			}),
			wilder.vim_search_pipeline(),
			{
				wilder.check(function(_, x)
					return x == ""
				end),
				wilder.history(),
				wilder.result({
					draw = {
						function(_, x)
							return icons.ui.Calendar .. x
						end,
					},
				}),
			}
		),
	})

	local wildmenu_renderer = wilder.wildmenu_renderer({
		apply_incsearch_fix = false,
		highlighter = wilder.lua_fzy_highlighter(),
		separator = " · ",
		left = { " ", wilder.wildmenu_spinner(), " " },
		right = { " ", wilder.wildmenu_index() },
	})

	wilder.set_option(
		"renderer",
		wilder.renderer_mux({
			["/"] = wildmenu_renderer,
			substitute = wildmenu_renderer,
		})
	)

	require("wilder").setup({ modes = { "/", "?" } })
end
