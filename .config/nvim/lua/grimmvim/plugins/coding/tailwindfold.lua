return {
	"razak17/tailwind-fold.nvim",
	opts = {},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = {
		"javascriptreact",
		"typescriptreact",
		"javascript",
		"typescript",
		"html",
		"vue",
		"php",
	},
	config = function()
		require("tailwind-fold").setup({
			ft = {
				"html",
				"svelte",
				"astro",
				"vue",
				"typescriptreact",
				"javascriptreact",
				"php",
				"blade",
			},
		})
	end,
}
