-- Appearance
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
vim.opt.termguicolors = true
vim.o.pumheight = 10 -- Max items to show in pop up menu
vim.o.cmdheight = 1 -- Max items to show in command menu
vim.o.guifont = "Monospace:h10" -- for neovide

-- Files and Others
vim.o.fileencoding = "utf-8" -- File Encoding
vim.g.loaded_netrw = 1 -- Helps opening links in the internet (probabilly -_-)
vim.g.loaded_netrwPlugin = 1
vim.opt.autochdir = true
vim.cmd("filetype plugin indent on")
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"

-- Split Windows
vim.o.splitbelow = true
vim.o.splitright = true

-- Update and backups
vim.o.conceallevel = 0
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 100

-- clipboard
vim.o.clipboard = "unnamedplus"

-- Backspace key
vim.o.backspace = "indent,eol,start"

-- Search
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Mouse and Scrolling
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.mouse = "a"

-- Wrapping
vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.wo.signcolumn = "yes"

-- Tabs and indentations
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.showtabline = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

-- Nvim Notify
vim.notify = require("notify")

-- Auto Formatting and LSP settings
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
