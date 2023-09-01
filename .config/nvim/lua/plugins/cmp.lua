vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- ###################################################################################################
-- requring necessary plugins
-- nvim-cmp
local installed, Cmp = pcall(require, "cmp")
if not installed then
	vim.notify("Plugin 'nvim-cmp' is not installed")
	return
end

-- luasnip
local installed, LuaSnip = pcall(require, "luasnip")
if not installed then
	vim.notify("Plugin 'luasnip' is not installed")
	return
end

-- lspkind
local installed, LspKind = pcall(require, "lspkind")
if not installed then
	vim.notify("Plugin 'lspkind' is not installed")
	return
end

-- luasnip.loaders.from_vscode
local installed, VScodeSnippets = pcall(require, "luasnip.loaders.from_vscode")
if not installed then
	vim.notify("Plugin 'luasnip' is not installed")
	return
end
-- ###################################################################################################
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- ###################################################################################################

-- Set up nvim-cmp.

Cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			LuaSnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	window = {
		completion = Cmp.config.window.bordered(),
		documentation = Cmp.config.window.bordered(),
	},

	mapping = Cmp.mapping.preset.insert({
		["<C-b>"] = Cmp.mapping.scroll_docs(-4),
		["<C-f>"] = Cmp.mapping.scroll_docs(4),
		["<C-Space>"] = Cmp.mapping.complete(),
		["<C-e>"] = Cmp.mapping.abort(),
		["<CR>"] = Cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}), -- end of mapping section

	-- Managing Sources for completions
	sources = Cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, { { name = "buffer" } }),

	formatting = {
		format = LspKind.cmp_format({ with_text = true, maxwidth = 50 }),
	},
})

-- Set configuration for specific filetype.
Cmp.setup.filetype("gitcommit", {
	sources = Cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
Cmp.setup.cmdline({ "/", "?" }, {
	mapping = Cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
Cmp.setup.cmdline(":", {
	mapping = Cmp.mapping.preset.cmdline(),
	sources = Cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- for vscode like snippets
VScodeSnippets.lazy_load()
