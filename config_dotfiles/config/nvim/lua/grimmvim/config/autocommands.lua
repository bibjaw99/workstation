-- code runner function
vim.api.nvim_create_augroup("RunMyCode", { clear = true })
local function CodeRunner(filetype, command)
	vim.api.nvim_create_autocmd("FileType", {
		group = "RunMyCode",
		pattern = filetype,
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<leader>R",
				":w<CR>:split term://" .. command .. " %<CR>:resize 10<CR>",
				{ desc = "Execute File", noremap = true, silent = true }
			)
		end,
	})
end

CodeRunner("javascript", "node")
CodeRunner("cpp", "mkdir -p test_builds && g++ % -o test_builds/%:t:r && ./test_builds/%:t:r")
CodeRunner("c", "mkdir -p test_builds && gcc % -o test_builds/%:t:r && ./test_builds/%:t:r")
CodeRunner("lua", "lua")
CodeRunner("python", "python3")
CodeRunner("sh", "bash")

-- keep cursor unchanged after quiting
vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim.",
})

-- disalbe commenting next line
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

-- hide cursor in SnacksDashboardOpened
vim.api.nvim_create_autocmd("User", {
	pattern = "SnacksDashboardOpened",
	callback = function()
		vim.cmd([[hi Cursor blend=100]])
		vim.cmd("set guicursor+=a:Cursor/lCursor")
	end,
})

-- unhide cursor in SnacksDashboardClosed
vim.api.nvim_create_autocmd("User", {
	pattern = "SnacksDashboardClosed",
	callback = function()
		vim.cmd([[hi Cursor blend=0]])
		vim.cmd("set guicursor+=a:Cursor/lCursor")
	end,
})

-- save text on change
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	pattern = "*",
	command = "silent! write",
})

-- enable linebreak for markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.opt.linebreak = true
	end,
})
