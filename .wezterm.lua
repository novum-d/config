local wezterm = require("wezterm")

local config = {
	color_scheme = "s3r0 modified (terminal.sexy)",
	font = wezterm.font_with_fallback({
		{ family = "JetBrains Mono" },
	}),
	font_size = 18,
	window_background_opacity = 0.85,
	use_ime = true,
	macos_window_background_blur = 20,
}

return config
