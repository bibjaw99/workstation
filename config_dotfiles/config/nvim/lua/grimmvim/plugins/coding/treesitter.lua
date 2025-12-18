return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
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
	config = function()
		local ts = require("nvim-treesitter")
		ts.install({
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
		})
		local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

		local ignore_filetypes = {
			"checkhealth",
			"lazy",
			"mason",
			"snacks_dashboard",
			"snacks_notif",
			"snacks_win",
		}

		-- Auto-install parsers and enable highlighting on FileType
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			desc = "Enable treesitter highlighting and indentation",
			callback = function(event)
				if vim.tbl_contains(ignore_filetypes, event.match) then
					return
				end

				local lang = vim.treesitter.language.get_lang(event.match) or event.match
				local buf = event.buf

				-- Start highlighting immediately (works if parser exists)
				pcall(vim.treesitter.start, buf, lang)

				-- Enable treesitter indentation
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				-- Install missing parsers (async, no-op if already installed)
				ts.install({ lang })
			end,
		})
	end,
}
