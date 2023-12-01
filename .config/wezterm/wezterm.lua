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
config.window_background_opacity = 0.85
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.scrollback_lines = 2000
config.window_padding = {
  left = 3,
  right = 0,
  top = 0,
  bottom = 0,
}

-- =======================================================================
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "DemiBold" })
config.font_size = 13

-- =======================================================================
return config
