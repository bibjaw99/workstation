return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	version = "*",
	event = "LspAttach",
	opts = {
		keymap = {
			preset = "default",
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
			default = { "luasnip", "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
