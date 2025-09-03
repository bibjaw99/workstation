-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "grimmvim.plugins.ui" },
		{ import = "grimmvim.plugins.coding" },
		{ import = "grimmvim.plugins.utils" },
		{ import = "grimmvim.plugins.lsp_completion" },
	},
	-- ui config
	ui = {
		border = "bold",
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
