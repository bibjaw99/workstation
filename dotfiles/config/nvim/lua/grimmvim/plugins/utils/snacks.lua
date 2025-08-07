return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- dashborad
		dashboard = {
			enabled = true,
			preset = {
				header = [[
        ╔═══════════════════════════════════════════════════════════════════════════════════╗
        ║  ██████╗   ██████╗   ██╗  ███╗   ███╗  ███╗   ███╗    ██╗   ██╗  ██╗  ███╗   ███╗ ║
        ║ ██╔════╝   ██╔══██╗  ██║  ████╗ ████║  ████╗ ████║    ██║   ██║  ██║  ████╗ ████║ ║
        ║ ██║  ███╗  ██████╔╝  ██║  ██╔████╔██║  ██╔████╔██║    ██║   ██║  ██║  ██╔████╔██║ ║
        ║ ██║   ██║  ██╔══██╗  ██║  ██║╚██╔╝██║  ██║╚██╔╝██║    ╚██╗ ██╔╝  ██║  ██║╚██╔╝██║ ║
        ║ ╚██████╔╝  ██║  ██║  ██║  ██║ ╚═╝ ██║  ██║ ╚═╝ ██║     ╚████╔╝   ██║  ██║ ╚═╝ ██║ ║
        ║  ╚═════╝   ╚═╝  ╚═╝  ╚═╝  ╚═╝     ╚═╝  ╚═╝     ╚═╝      ╚═══╝    ╚═╝  ╚═╝     ╚═╝ ║
        ╚═══════════════════════════════════════════════════════════════════════════════════╝
        ]],
				keys = {
					{ key = "SPC o", desc = "Options" },
					{ key = "SPC f", desc = "Fuzzy Find" },
					{ key = "SPC s", desc = "Session" },
					{ key = "SPC b", desc = "Beffers" },
					{ key = "SPC e", desc = "Filetree" },
					{ key = "SPC l", desc = "LSP" },
					{ key = "SPC p", desc = "Window" },
					{ key = "SPC g", desc = "Gitsigns" },
					{ key = "SPC c", desc = "Snacks" },
					{ key = "SPC n", desc = "Noice" },
				},
			},
			formats = {
				footer = { "%s", align = "center" },
				header = { "%s", align = "center" },
			},
		},
		-- indent guide lines
		indent = {
			enabled = true,
			animate = {
				enabled = false,
			},
			scope = {
				enabled = false,
			},

			-- can be a list of hl groups to cycle through
			indent = {
				hl = {
					"SnacksIndent1",
					"SnacksIndent2",
					"SnacksIndent3",
					"SnacksIndent4",
					"SnacksIndent5",
					"SnacksIndent6",
					"SnacksIndent7",
				},
			},
		},
		-- picker
		picker = {
			enabled = true,
			prompt = "> ",
			ui_select = true,
			formatters = {
				file = {
					filename_first = true,
					truncate = 100, -- truncate the file path to (roughly) this length
				},
			},
			layouts = {
				-- default layout
				default = {
					layout = {
						box = "horizontal",
						width = 0.90,
						height = 0.90,
						{
							box = "vertical",
							border = "bold",
							title = "{source} {live}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
						{ win = "preview", title = "{preview}", border = "bold", width = 0.5 },
					},
				},
				-- vertical layout
				vertical = {
					layout = {
						backdrop = false,
						width = 0.5,
						min_width = 80,
						height = 0.8,
						min_height = 30,
						box = "vertical",
						border = "bold",
						title = "{title} {live} {flags}",
						title_pos = "center",
						{ win = "input", height = 1, border = "bottom" },
						{ win = "list", border = "none" },
						{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
					},
				},
			},
			win = {
				-- input window
				input = {
					keys = {
						["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
						["<Esc>"] = { "close", mode = { "i", "n" } },
						["<C-\\>"] = { "toggle_preview", mode = { "i", "n" } },
					},
				},
			},
		},
		-- notifier
		notifier = {
			enabled = true,
			timeout = 2000,
			style = "compact",
			width = { min = 35, max = 0.8 },
			height = { min = 1, max = 0.8 },
		},
		bigfile = {
			enabled = true,
		},
		lazygit = {
			enabled = false,
		},
		terminal = {
			enabled = false,
		},
		input = {
			enabled = true,
		},
		quickfile = {
			enabled = false,
		},
		scroll = {
			enabled = false,
		},
		statuscolumn = {
			enabled = false,
		},
		words = {
			enabled = false,
		},
		layout = {
			enabled = false,
		},
		debug = {
			enabled = false,
		},
	}, -- end of options
	keys = {
		-- picker
		{
			mode = "n",
			"<leader>ff",
			':lua require("snacks").picker.files()<cr>',
			desc = "Find Files",
		},
		{
			mode = "n",
			"<leader>fo",
			':lua require("snacks").picker.recent({layout={preview=false}})<cr>',
			desc = "Find Recent Files",
		},
		{
			mode = "n",
			"<leader>fO",
			':lua require("snacks").picker.recent({ filter = { cwd = true }})<cr>',
			desc = "Recent CWD Files",
		},
		{
			mode = "n",
			"<leader>fr",
			':lua require("snacks").picker.resume()<cr>',
			desc = "Resume Picker",
		},
		{
			mode = "n",
			"<leader>fb",
			':lua require("snacks").picker.buffers()<cr>',
			desc = "Find Buffers",
		},
		{
			mode = "n",
			"<leader>fg",
			':lua require("snacks").picker.grep()<cr>',
			desc = "Grep",
		},
		{
			mode = "n",
			"<leader>fG",
			':lua require("snacks").picker.grep_buffers()<cr>',
			desc = "Grep Buffers",
		},
		{
			mode = "n",
			"<leader>fc",
			':lua require("snacks").picker.grep_word()<cr>',
			desc = "Grep Under Cursor",
		},
		{
			mode = "n",
			"<leader>fw",
			':lua require("snacks").picker.lines()<cr>',
			desc = "Grep Lines",
		},
		{
			mode = "n",
			"<leader>fk",
			':lua require("snacks").picker.keymaps()<cr>',
			desc = "Find Kyes",
		},
		{
			mode = "n",
			"<leader>fh",
			':lua require("snacks").picker.help()<cr>',
			desc = "Get Help",
		},
		-- notifier
		{
			mode = "n",
			"<leader>cn",
			':lua require("snacks").notifier.show_history()<cr>',
			desc = "Notifications",
		},
		-- dim mode
		{
			mode = "n",
			"<leader>cd",
			':lua require("snacks").dim()<cr>',
			desc = "Dim",
		},
		{
			mode = "n",
			"<leader>cD",
			':lua require("snacks").dim.disable()<cr>',
			desc = "Dim Disable",
		},
		-- zen mode
		{
			mode = "n",
			"<leader>cz",
			':lua require("snacks").zen()<cr>',
			desc = "Zen Mode",
		},
		-- lazygit
		{
			mode = "n",
			"<leader>cg",
			':lua require("snacks").lazygit()<cr>',
			desc = "LazyGit",
		},
		-- buffdelete
		{
			mode = "n",
			"<leader>bx",
			':lua require("snacks").bufdelete()<cr>',
			desc = "Delete Buffer",
		},
		{
			mode = "n",
			"<leader>bo",
			':lua require("snacks").bufdelete.other()<cr>',
			desc = "Delete Other Buffer",
		},
	},
}
