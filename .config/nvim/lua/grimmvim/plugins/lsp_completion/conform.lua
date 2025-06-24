return {
	"stevearc/conform.nvim",
	event = { "InsertEnter", "LspAttach" },
	opts = {
		formatters_by_ft = {
			javascript = { "biome" },
			typescript = { "biome" },
			javascriptreact = { "biome" },
			typescriptreact = { "biome" },
			json = { "biome" },
			svelte = { "prettier" },
			css = { "biome" },
			html = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			liquid = { "prettier" },
			lua = { "stylua" },
			python = { "isort", "black" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
	},
	keys = {
		{
			mode = { "n", "v" },
			"<leader>Fm",
			function()
				require("conform").format({
					lsp_fallback = true,
					timeout_ms = 1000,
				})
			end,
			desc = "Conform: Format Manually",
		},
	},
}
