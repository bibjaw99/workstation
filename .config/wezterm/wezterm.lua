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
config.window_background_opacity = 0.7
config.default_cursor_style = "SteadyBar"
config.enable_tab_bar = false

-- =======================================================================
config.font = wezterm.font("VictorMono Nerd Font Mono", { weight = "DemiBold", italic = false })
config.font_size = 13
config.font_rules = {
	-- Bold
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("VictorMono Nerd Font Mono", {
			weight = "Bold",
			style = "Normal",
		}),
	},
	-- Italic
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("VictorMono Nerd Font Mono", {
			weight = "Bold",
		}),
	},
}

-- =======================================================================
return config
