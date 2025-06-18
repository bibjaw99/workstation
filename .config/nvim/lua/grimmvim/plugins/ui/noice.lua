return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		routes = {
			{
				filter = {
					any = {
						{
							event = { "notify", "msg_show" },
							find = "No information available",
						},
						{
							event = "msg_show",
							kind = "",
							find = "written",
						},
					},
				},
				opts = {
					skip = true,
				},
			},
		},
		-- views options
		views = {
			notify = {
				scrollbar = false,
			},
			split = {
				enter = true,
				scrollbar = false,
			},
			vsplit = {
				scrollbar = false,
			},
			popup = {
				scrollbar = false,
			},
			mini = {
				scrollbar = false,
			},
			cmdline = {
				scrollbar = false,
			},
			cmdline_popup = {
				scrollbar = false,
			},
			cmdline_output = {
				scrollbar = false,
			},
			messages = {
				scrollbar = false,
			},
			confirm = {
				scrollbar = false,
			},
			hover = {
				scrollbar = false,
			},
			popupmenu = {
				scrollbar = false,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
		},
	},

	-- keymaps
	keys = {
		{
			mode = "n",
			"<leader>nh",
			":Noice history<cr>",
			desc = "Noice History",
		},
		{
			mode = "n",
			"<leader>nl",
			":Noice last<cr>",
			desc = "Noice Last msg",
		},
		{
			mode = "n",
			"<leader>na",
			":Noice all<cr>",
			desc = "Noice all",
		},
		{
			mode = "n",
			"<leader>nd",
			":Noice dismiss<cr>",
			desc = "Noice Dismiss",
		},
	},
}
