require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- Masong Lsp config

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"cssls",
		"marksman",
	},
})

-- Mason automatically installs required tools for nvim-dap
require("mason-nvim-dap").setup({
	ensure_installed = { "python", "stylua" },
	handlers = {}, -- sets up dap in the predefined manner
})

-- Mason Tool Installer
require("mason-tool-installer").setup({
	-- a list of all tools you want to ensure are installed upon
	-- start; they should be the names Mason uses for each tool
	ensure_installed = {
		-- you can turn off/on auto_update per tool
		{ "bash-language-server", auto_update = true },
		{ "lua-language-server", auto_update = true },
		{ "vim-language-server", auto_update = true },
		{ "stylua", auto_update = true },
		{ "editorconfig-checker" },
		{ "html-lsp" },
		{ "css-lsp" },
		{ "pyright" },
		{ "black" },
		{ "autopep8" },
		{ "json-lsp" },
		{ "prettier" },
	},

	-- if set to true this will check each tool for updates. If updates
	-- are available the tool will be updated. This setting does not
	-- affect :MasonToolsUpdate or :MasonToolsInstall.
	-- Default: false
	auto_update = false,

	-- automatically install / update on startup. If set to false nothing
	-- will happen on startup. You can use :MasonToolsInstall or
	-- :MasonToolsUpdate to install tools and check for updates.
	-- Default: true
	run_on_start = true,

	-- set a delay (in ms) before the installation starts. This is only
	-- effective if run_on_start is set to true.
	-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
	-- Default: 0
	start_delay = 3000, -- 3 second delay

	-- Only attempt to install if 'debounce_hours' number of hours has
	-- elapsed since the last time Neovim was started. This stores a
	-- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
	-- This is only relevant when you are using 'run_on_start'. It has no
	-- effect when running manually via ':MasonToolsInstall' etc....
	-- Default: nil
	debounce_hours = 5, -- at least 5 hours between attempts to install/update
})

-- Managing language servers

local lspconfig = require("lspconfig") -- Setup built LSP config
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- pyright
lspconfig.pyright.setup({
	capabilities = capabilities,
})
-- tsserver
lspconfig.tsserver.setup({
	capabilities = capabilities,
})
-- rust_analyzer
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		["rust-analyzer"] = {},
	},
})

-- html
lspconfig.html.setup({
	capabilities = capabilities,
})

-- Lua LS
lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

-- CSS LS
lspconfig.cssls.setup({
	capabilities = capabilities,
})
