local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "s3r0 modified (terminal.sexy)"
config.warn_about_missing_glyphs = false
config.font_size = 16.0

return config
