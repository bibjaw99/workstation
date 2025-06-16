return {
	"neovim/nvim-lspconfig",
	event = { "InsertEnter", "CmdlineEnter", "LspAttach" },
	dependencies = {
		{ "saghen/blink.cmp", version = "1.*" },
	},
	opts = {
		diagnostics = {
			virtual_text = false,
		},
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			pyright = {},
			ts_ls = {},
			eslint = {},
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {},
				},
			},
			clangd = {},
			html = {},
			emmet_ls = {
				filetypes = {
					"html",
					"typescriptreact",
					"javascriptreact",
					"css",
					"sass",
					"scss",
					"less",
					"svelte",
				},
			},
			cssls = {
				settings = {
					css = {
						validate = true,
						lint = { unknownAtRules = "ignore" },
					},
					scss = {
						validate = true,
						lint = { unknownAtRules = "ignore" },
					},
					less = {
						validate = true,
						lint = { unknownAtRules = "ignore" },
					},
				},
			},
			tailwindcss = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
