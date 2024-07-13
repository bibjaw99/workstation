return {
	"jose-elias-alvarez/null-ls.nvim",
  event = "VeryLazy",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local sources = {
			formatting.stylua,
			formatting.prettier,
			formatting.autopep8,
			formatting.black,
			formatting.isort,
			formatting.eslint_d,
			formatting.clang_format,
		}
		null_ls.setup({
			sources = sources,
		})
	end,
}
