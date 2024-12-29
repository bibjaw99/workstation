# blink_nvim:

```lua
return {
	"saghen/blink.cmp",
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
				auto_show_delay_ms = 0,
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
```

# nvim cmp old config

```lua
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local vscodesnippets = require("luasnip.loaders.from_vscode")
		local tailwindcss_cmp = require("tailwindcss-colorizer-cmp")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}), -- end of mapping section

			-- Managing Sources for completions
			sources = cmp.config.sources({
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			formatting = {
				format = function(entry, item)
					-- Apply apply lspkind formatter
					item = lspkind.cmp_format({ with_text = true, maxwidth = 50 })(entry, item)

					-- Then apply tailwindcss-colorizer-cmp formatter
					return tailwindcss_cmp.formatter(entry, item)
				end,
			},
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		-- tailwindcss_cmp
		tailwindcss_cmp.setup({
			color_square_width = 2,
		})

		--  VS Code like snippets
		vscodesnippets.lazy_load()
	end,
}
```

---

# lspconfig

```lua
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local lspui = require("lspconfig.ui.windows")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		--LspInfo Borders
		lspui.default_options.border = "double"

		-- Managing language servers individually
		-- pyright
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		-- tsserver
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			init_options = {
				preferences = {
					disableSuggestions = true,
				},
			},
		})

		-- rust_analyzer
		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			-- Server-specific settings. See `:help lspconfig-setup`
			settings = {
				["rust-analyzer"] = {},
			},
		})

		-- clangd
		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		-- html
		lspconfig.html.setup({
			capabilities = capabilities,
		})

		-- configure emmet language server
		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- Lua LS
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- CSS LS
		lspconfig.cssls.setup({
			capabilities = capabilities,
			settings = {
				css = { validate = true, lint = {
					unknownAtRules = "ignore",
				} },
				scss = { validate = true, lint = {
					unknownAtRules = "ignore",
				} },
				less = { validate = true, lint = {
					unknownAtRules = "ignore",
				} },
			},
		})

		-- Tailwind
		-- Support for tailwind auto completion
		-- install the tailwind server : "sudo npm install -g @tailwindcss/language-server"
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})
	end,
}
```
