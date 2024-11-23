local cmd = vim.cmd
local opt = vim.opt

cmd("let g:netrw_liststyle = 3")
cmd("filetype plugin indent on")
cmd([[highlight WinSeparator guibg = None]])

-- Appearance
opt.termguicolors = true
opt.pumheight = 10
opt.cmdheight = 0
opt.conceallevel = 0
opt.laststatus = 3
opt.showtabline = 0

-- Files and Others
opt.fileencoding = "utf-8" -- File Encoding
opt.autochdir = true
opt.hidden = true
opt.whichwrap = "b,s,<,>,[,],h,l"
opt.iskeyword:append("-,_")
opt.virtualedit = "block"

opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.cursorline = false
opt.cursorcolumn = false
opt.signcolumn = "yes"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true

opt.fillchars = { eob = " " }

opt.clipboard = "unnamedplus"
opt.backspace = "indent,eol,start"

opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.scrolloff = 5
opt.sidescrolloff = 5
opt.mouse = "n"

-- Split Windows
opt.splitbelow = true
opt.splitright = true
opt.inccommand = "split"

-- Update and backups
opt.showmode = false
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.timeoutlen = 500

-- keep cursor unchanged after quiting
vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim.",
})

-- Options based on filetypes
-- markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt.wrap = true
		vim.opt.linebreak = true
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.bo.softtabstop = 2
		vim.opt.expandtab = true
	end,
})

-- disalbe commenting next line
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})
