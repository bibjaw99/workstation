return {
	"razak17/tailwind-fold.nvim",
	opts = {},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",
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
