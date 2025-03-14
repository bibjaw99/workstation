local cmd = vim.cmd
local opt = vim.opt

cmd("let g:netrw_liststyle = 3")
cmd("filetype plugin indent on")

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
opt.cursorline = true
opt.cursorcolumn = false
opt.signcolumn = "yes"
opt.wrapscan = false

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

opt.scrolloff = 999
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
