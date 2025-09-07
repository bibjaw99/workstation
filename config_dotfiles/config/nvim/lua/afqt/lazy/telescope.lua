-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
			pcall(require("telescope").load_extension, "smart_history")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<space>fd", builtin.find_files, { desc = "[F]ind file or [D]irectory" })
			vim.keymap.set("n", "<space>ft", builtin.git_files, { desc = "[F]ind in Git [T]ree" })
			vim.keymap.set("n", "<space>fh", builtin.help_tags, { desc = "[F]ind [H]elp (by tag)" })
			vim.keymap.set("n", "<space>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
			vim.keymap.set(
				"n",
				"<space>f/",
				builtin.current_buffer_fuzzy_find,
				{ desc = "[F]ind in current buffer [/]" }
			)

			vim.keymap.set("n", "<space>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })

			vim.keymap.set("n", "<space>fa", function()
				---@diagnostic disable-next-line: param-type-mismatch
				builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
			end)

			vim.keymap.set("n", "<space>fc", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[F]ind in [C]onfig" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
