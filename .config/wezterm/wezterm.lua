local wezterm = require("wezterm")
local config = {}

-- =======================================================================
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- =======================================================================
config.color_scheme = "custom"
config.window_background_opacity = 1
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.scrollback_lines = 2000
config.window_padding = {
	left = "8px",
	right = "2px",
	top = "8px",
	bottom = "0px",
}

-- =======================================================================
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13.9
config.font_rules = {

	-- Rule for bold text
	{
		italic = false,
		intensity = "Bold",
		font = wezterm.font("JetBrains Mono", { weight = "ExtraBold" }),
	},

	-- Rule for italic text
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font("JetBrains Mono", { weight = "Bold", style = "Italic" }),
	},

	-- Rule for bodl italic text
	{
		italic = true,
		intensity = "Bold",
		font = wezterm.font("JetBrains Mono", { weight = "ExtraBold", style = "Italic" }),
	},
}
config.bold_brightens_ansi_colors = true

config.line_height = 1.1
config.cell_width = 1
-- =======================================================================
return config
