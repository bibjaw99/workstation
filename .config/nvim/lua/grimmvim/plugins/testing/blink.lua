return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
	},
	version = "*",
	event = "LspAttach",
	opts = {
		keymap = {
			preset = "enter",
			["<CR>"] = { "select_and_accept", "fallback" },
			["<C-p>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-n>"] = { "select_next", "snippet_forward", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			cmdline = {
				keymap = {
					preset = "enter",
					["<Tab>"] = {
						"show",
						"select_next",
						"snippet_forward",
						"fallback",
					},
					["<S-Tab>"] = {
						"show",
						"select_prev",
						"snippet_backward",
						"fallback",
					},
				},
			},
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				border = "single",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "single",
				},
			},
		},
		sources = {
			default = { "lsp", "luasnip", "buffer", "path", "snippets" },
			cmdline = {},
			providers = {
				lsp = {
					enabled = true,
					name = "LSP",
					module = "blink.cmp.sources.lsp",
					score_offset = 90,
					-- fallbacks = { "luasnip", "path", "snippets", "buffer" },
				},
				luasnip = {
					enabled = true,
					min_keyword_length = 2,
					name = "LSP",
					module = "blink.cmp.sources.luasnip",
					score_offset = 85,
				},
				buffer = {
					enabled = true,
					name = "LSP",
					module = "blink.cmp.sources.buffer",
					score_offset = 80,
				},
				snippets = {
					enabled = true,
					name = "LSP",
					module = "blink.cmp.sources.snippets",
					score_offset = 75,
				},
				path = {
					enabled = true,
					name = "LSP",
					module = "blink.cmp.sources.path",
					score_offset = 70,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
