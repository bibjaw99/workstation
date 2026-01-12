return {
	"MeanderingProgrammer/treesitter-modules.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			opts = {},
			ft = {
				"javascriptreact",
				"typescriptreact",
				"javascript",
				"typescript",
				"html",
				"vue",
				"php",
			},
		},
	},

	opts = {
		ensure_installed = {
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"prisma",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"cpp",
			"python",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		inndent = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		require("treesitter-modules").setup(opts)
	end,
}
