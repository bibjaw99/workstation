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
config.term = "xterm-256color"
config.window_decorations = "NONE"
config.window_background_opacity = 1
config.window_close_confirmation = "NeverPrompt"
config.line_height = 1
config.cell_width = 1
config.enable_scroll_bar = false
-- config.freetype_load_target = "HorizontalLcd"
config.enable_tab_bar = false
config.scrollback_lines = 2000
config.window_padding = {
	left = "0.5cell",
	right = "0.25cell",
	top = "0.3cell",
	bottom = "0cell",
}

-- =======================================================================
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "DemiBold" })
config.font_size = 15
config.font_rules = {

	-- bold font
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font Mono",
			weight = "ExtraBold",
		}),
	},

	-- italic font
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font Mono",
			weight = "DemiBold",
			style = "Italic",
		}),
	},

	-- bold italic font
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font Mono",
			weight = "ExtraBold",
			style = "Italic",
		}),
	},
}
config.bold_brightens_ansi_colors = true

-- =======================================================================
return config
