local installed, alpha = pcall(require, "alpha")
if not installed then
	return
end

local installed, Dashboard = pcall(require, "alpha.themes.dashboard")
if not installed then
	return
end

local dashboard = Dashboard
dashboard.section.header.val = {
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
}

dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", "<cmd>ene <CR>"),
	dashboard.button("SPC s f", "  Find file"),
	dashboard.button("SPC s o", "  Recently opened files"),
	dashboard.button("SPC s r", "  Resume Telescope"),
	dashboard.button("SPC s g", "  Find word"),
	dashboard.button("SPC s b", "  Open buffers"),
}
opts = {
	position = "center",
	hl = "Type",
	-- wrap = "overflow";
}

local function footer()
	return "Programming is an art of patience not talent"
end

dashboard.section.footer.val = footer()

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
