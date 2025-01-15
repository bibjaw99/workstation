return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
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
		-- HACK: noice shows messages from before it was enabled,
		-- but this is not ideal when Lazy is installing plugins,
		-- so clear the messages in this case.
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
