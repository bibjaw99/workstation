return {
	"mbbill/undotree",
	event = "VeryLazy",
	config = function()
		local map = vim.keymap.set

		-- reset the window size from the last time
		local api = vim.api
		local function setUndotreeWinSize()
			local winList = api.nvim_list_wins()
			for _, winHandle in ipairs(winList) do
				if
					api.nvim_win_is_valid(winHandle)
					and api.nvim_buf_get_option(api.nvim_win_get_buf(winHandle), "filetype") == "undotree"
				then
					api.nvim_win_set_width(winHandle, vim.g.undotree_SplitWidth)
				end
			end
		end

		api.nvim_create_user_command("Ut", function()
			api.nvim_cmd(api.nvim_parse_cmd("UndotreeToggle", {}), {})
			setUndotreeWinSize()
		end, { desc = "load undotree" })

		-- keymaps
		map("n", "<leader>uu", ":UndotreeToggle<cr>", { desc = "UndoTree Toggle", noremap = true, silent = true })
		map("n", "<leader>uf", ":UndotreeFocus<cr>", { desc = "UndoTree Focus", noremap = true, silent = true })
	end,
}
