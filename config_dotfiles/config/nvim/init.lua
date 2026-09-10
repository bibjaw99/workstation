vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("vim._core.ui2").enable({
	enable = true,
	msg = {
		target = "cmd",
		pager = { height = 0.5 },
		dialog = { height = 0.5 },
		cmd = { height = 0.5 },
		msg = { height = 0.5, timeout = 4500 },
	},
})

require("grimmvim.config")
