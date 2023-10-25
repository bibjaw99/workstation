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

-- =======================================================================
config.font = wezterm.font("VictorMono Nerd Font Mono")
config.font_size = 13

-- =======================================================================
config.enable_tab_bar = false

return config
