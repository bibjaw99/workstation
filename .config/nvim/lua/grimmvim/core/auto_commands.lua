local map = vim.api.nvim_buf_set_keymap
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Create an autocmd group for executing files
augroup("RunOnSave", { clear = true })

local function RunKeymap(filetype, command)
	autocmd("FileType", {
		group = "RunOnSave",
		pattern = filetype,
		callback = function()
			map(
				0,
				"n",
				"<leader><leader>r",
				":w<CR>:split term://" .. command .. " %<CR>:resize 10<CR>",
				{ desc = "Execute File", noremap = true, silent = true }
			)
		end,
	})
end

-- Define the commands for each filetype
RunKeymap("javascript", "node")
RunKeymap("cpp", "g++ % -o %:r && ./%:r")
RunKeymap("c", "gcc % -o %:r && ./%:r")
RunKeymap("lua", "lua")
RunKeymap("python", "python")

-- keep cursor unchanged after quiting
autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim.",
})

-- Options for markdown
autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt.wrap = false
		vim.opt.linebreak = true
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.bo.softtabstop = 2
		vim.opt.expandtab = true
	end,
})

-- disalbe commenting next line
autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})
