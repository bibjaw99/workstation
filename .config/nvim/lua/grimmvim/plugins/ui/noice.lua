return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
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
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
			signature = {
				enabled = false,
			},
			hover = {
				enabled = false,
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
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
	},
	config = function(_, opts)
		local map = vim.keymap.set
		if vim.o.filetype == "lazy" then
			vim.cmd([[messages clear]])
		end
		require("noice").setup(opts)
		-- keymaps
		map("n", "<leader>nh", ":Noice history<cr>", { desc = "History", noremap = true, silent = true })
		map("n", "<leader>nl", ":Noice last<cr>", { desc = "Last Msg", noremap = true, silent = true })
		map("n", "<leader>na", ":Noice all<cr>", { desc = "All Msg", noremap = true, silent = true })
		map("n", "<leader>nd", ":Noice dismiss<cr>", { desc = "Dismiss", noremap = true, silent = true })
		map("n", "<leader>np", ":Noice pick<cr>", { desc = "Pick", noremap = true, silent = true })
	end,
}
