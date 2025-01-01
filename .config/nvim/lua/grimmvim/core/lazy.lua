local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local installed, lazy = pcall(require, "lazy")
if not installed then
	return
end

lazy.setup({
	-- importing directories
	spec = {
		{ import = "grimmvim.plugins.coding" },
		{ import = "grimmvim.plugins.lsp" },
		{ import = "grimmvim.plugins.ui" },
		{ import = "grimmvim.plugins.util" },
	},

	-- ui config
	ui = {
		border = "double",
		size = {
			width = 0.8,
			height = 0.8,
		},
	},

	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
