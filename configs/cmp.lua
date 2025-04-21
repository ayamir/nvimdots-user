return function()
	local icons = {
		kind = require("modules.utils.icons").get("kind"),
		type = require("modules.utils.icons").get("type"),
		cmp = require("modules.utils.icons").get("cmp"),
	}

	local compare = require("cmp.config.compare")
	compare.lsp_scores = function(entry1, entry2)
		local diff
		if entry1.completion_item.score and entry2.completion_item.score then
			diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
		else
			diff = entry2.score - entry1.score
		end
		return (diff < 0)
	end

	local use_copilot = require("core.settings").use_copilot
	local comparators = use_copilot == true
			and {
				require("copilot_cmp.comparators").prioritize,
				require("copilot_cmp.comparators").score,
				-- require("cmp_tabnine.compare"),
				compare.offset, -- Items closer to cursor will have lower priority
				compare.exact,
				-- compare.scopes,
				compare.lsp_scores,
				compare.sort_text,
				compare.score,
				compare.recently_used,
				-- compare.locality, -- Items closer to cursor will have higher priority, conflicts with `offset`
				require("cmp-under-comparator").under,
				compare.kind,
				compare.length,
				compare.order,
			}
		or {
			-- require("cmp_tabnine.compare"),
			compare.offset, -- Items closer to cursor will have lower priority
			compare.exact,
			-- compare.scopes,
			compare.lsp_scores,
			compare.sort_text,
			compare.score,
			compare.recently_used,
			-- compare.locality, -- Items closer to cursor will have higher priority, conflicts with `offset`
			require("cmp-under-comparator").under,
			compare.kind,
			compare.length,
			compare.order,
		}

	local cmp_ui = require("nvconfig").ui.cmp
	local cmp_style = cmp_ui.style
	local format_color = require("nvchad.cmp.format")
	local atom_styled = cmp_style == "atom" or cmp_style == "atom_colored"
	local fields = (atom_styled or cmp_ui.icons_left) and { "kind", "abbr", "menu" } or { "abbr", "kind", "menu" }

	local cmp = require("cmp")
	require("cmp").setup({
		preselect = cmp.PreselectMode.None,
		window = {
			completion = {
				scrollbar = false,
				side_padding = 1,
				winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder",
				border = "single",
			},

			documentation = {
				border = "single",
				winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
			},
		},
		sorting = {
			priority_weight = 2,
			comparators = comparators,
		},
		formatting = {
			format = function(entry, item)
				local icons = require("nvchad.icons.lspkind")
				local icon = icons[item.kind] or ""
				local kind = item.kind or ""

				if atom_styled then
					item.menu = kind
					item.menu_hl_group = "LineNr"
					item.kind = " " .. icon .. " "
				elseif cmp_ui.icons_left then
					item.menu = kind
					item.menu_hl_group = "CmpItemKind" .. kind
					item.kind = icon
				else
					item.kind = " " .. icon .. " " .. kind
					item.menu_hl_group = "comment"
				end

				if kind == "Color" and cmp_ui.format_colors.lsp then
					format_color.lsp(entry, item, (not (atom_styled or cmp_ui.icons_left) and kind) or "")
				end

				if #item.abbr > cmp_ui.abbr_maxwidth then
					item.abbr = string.sub(item.abbr, 1, cmp_ui.abbr_maxwidth) .. "…"
				end

				-- deduplicate results from nvim_lsp
				if entry.source.name == "nvim_lsp" then
					item.dup = 0
				end

				return item
			end,
			fields = fields,
		},
		matching = {
			disallow_partial_fuzzy_matching = false,
		},
		performance = {
			async_budget = 1,
			max_view_entries = 120,
		},
		-- You can set mappings if you want
		mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-w>"] = cmp.mapping.abort(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				elseif require("luasnip").expand_or_locally_jumpable() then
					require("luasnip").expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				elseif require("luasnip").jumpable(-1) then
					require("luasnip").jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<CR>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
					else
						fallback()
					end
				end,
				s = cmp.mapping.confirm({ select = true }),
				c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
			}),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		-- You should specify your *installed* sources.
		sources = {
			{ name = "nvim_lsp", max_item_count = 350 },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "treesitter" },
			{ name = "spell" },
			{ name = "tmux" },
			{ name = "orgmode" },
			{ name = "marscode" },
			{
				name = "buffer",
				option = {
					get_bufnrs = function()
						return vim.api.nvim_buf_line_count(0) < 7500 and vim.api.nvim_list_bufs() or {}
					end,
				},
			},
			{ name = "latex_symbols" },
			{ name = "copilot" },
			-- { name = "codeium" },
			-- { name = "cmp_tabnine" },
		},
		experimental = {
			ghost_text = {
				hl_group = "Whitespace",
			},
		},
	})
end
